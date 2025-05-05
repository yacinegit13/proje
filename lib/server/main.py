from fastapi import FastAPI, File, UploadFile # type: ignore
from fastapi.responses import JSONResponse # type: ignore
import cv2 # type: ignore
import mediapipe as mp # type: ignore
import numpy as np # type: ignore
from io import BytesIO
from PIL import Image # type: ignore

app = FastAPI()

# Initialize MediaPipe
mp_hands = mp.solutions.hands
mp_drawing = mp.solutions.drawing_utils
hands = mp_hands.Hands(static_image_mode=True, 
                      max_num_hands=2,
                      min_detection_confidence=0.3,  # Lowered from 0.5
                      min_tracking_confidence=0.3)   # Lowered from 0.5

# Define gesture recognition function
def recognize_gesture(landmarks):
    fingers = []
    tip_ids = [4, 8, 12, 16, 20]  # Thumb, Index, Middle, Ring, Pinky
    
    # Thumb detection
    thumb_tip = landmarks[tip_ids[0]]
    thumb_ip = landmarks[tip_ids[0]-1]
    if abs(thumb_tip.x - thumb_ip.x) > 0.05:
        fingers.append(1)  # Thumb open
    else:
        fingers.append(0)  # Thumb closed
    
    # Other fingers detection
    for i in range(1, 5):
        finger_tip = landmarks[tip_ids[i]]
        finger_dip = landmarks[tip_ids[i]-2]
        fingers.append(1 if finger_tip.y < finger_dip.y else 0)
    
    finger_binary = "".join(map(str, fingers))
    print(f"Finger binary: {finger_binary}")  # Debug output
    
    # Gesture dictionary
    gestures = {
        "11111": "OPEN HAND",
        "00000": "FIST",
        "01000": "POINTING",
        "00011": "OK",
        "01111": "THUMBS UP",
        "11110": "THUMBS DOWN",
        "01011": "ROCK ON",
        "11001": "LOVE",
        "00111": "PEACE"
    }
    
    return gestures.get(finger_binary, "UNKNOWN")

@app.post("/server/")
async def recognize_gesture_endpoint(file: UploadFile = File(...)):
    try:
        # Read image from upload
        contents = await file.read()
        image = Image.open(BytesIO(contents))
        frame = np.array(image)

        # Save the uploaded image for debugging
        image.save("debug_uploaded.jpg")

        # Print frame shape for debugging
        print(f"Frame shape: {frame.shape}")
        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        print(f"RGB frame shape: {frame_rgb.shape}")

        # Optional: Resize image if needed
        frame_rgb = cv2.resize(frame_rgb, (640, 480))  # Adjust size as needed

        results = hands.process(frame_rgb)

        gesture = "NO_HAND_DETECTED"
        if results.multi_hand_landmarks:
            for hand_landmarks in results.multi_hand_landmarks:
                landmark_list = [landmark for landmark in hand_landmarks.landmark]
                gesture = recognize_gesture(landmark_list)
                # Draw landmarks for debugging
                annotated_image = frame.copy()
                mp_drawing.draw_landmarks(annotated_image, hand_landmarks, mp_hands.HAND_CONNECTIONS)
                cv2.imwrite("debug_annotated.jpg", cv2.cvtColor(annotated_image, cv2.COLOR_RGB2BGR))
                break  # Process only the first hand for simplicity

        return JSONResponse(content={"gesture": gesture})
    except Exception as e:
        return JSONResponse(content={"error": str(e)}, status_code=500)

if __name__ == "__main__":
    import uvicorn # type: ignore
    uvicorn.run(app, host="0.0.0.0", port=8000)