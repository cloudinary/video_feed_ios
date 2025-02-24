# 📹 Video Feed App (iOS) – TikTok-Style Vertical Scrolling Videos

This is a **Swift iOS video feed app** inspired by **TikTok**, built using **Protocol-Oriented Programming (POP)** and **MVVM architecture**. It supports **smooth vertical scrolling**, **auto-playing videos**, and **Cloudinary integration** for media handling.

---

## **🚀 Features**
✅ **Full-Screen Video Feed** – Users can scroll vertically through full-screen videos.  
✅ **Auto-Playing Videos** – Videos automatically play when visible and pause when scrolled away.  
✅ **Looping Playback** – Each video loops continuously.  
✅ **Cloudinary Video Integration** – Videos are streamed from Cloudinary.  
✅ **Custom UICollectionView Layout** – Ensures perfect page-snapping to avoid overlap.  
✅ **Toolbar Navigation** – Bottom navigation for additional app sections.  

---

## **🛠 Technologies Used**
- **Swift 5** – Modern and efficient coding.
- **UIKit & Storyboards** – UI is built using Storyboards.
- **AVPlayerViewController** – Handles video playback.
- **Cloudinary iOS SDK** – Streams and manages videos.
- **Protocol-Oriented Programming (POP)** – Modular, reusable components.
- **UICollectionView** – Custom layout for smooth vertical scrolling.

---

### **1️⃣ Prefetched Videos**
- **Definition**: Preloads videos into a local cache for **instant playback**.
- **Pros**: Reduces buffering & ensures a smooth user experience.
- **Cons**: Higher data usage; not efficient for poor network conditions.

### **2️⃣ Adaptive Bitrate (ABR) Streaming**
- **Definition**: Dynamically adjusts video quality **based on network speed**.
- **Pros**: Optimized playback for users with **slow internet** or **mobile data**.
- **Cons**: Initial buffering may be slightly longer.

🚀 **This app is optimized for Adaptive Bitrate (ABR) streaming using Cloudinary**, but prefetching can be added if needed.
