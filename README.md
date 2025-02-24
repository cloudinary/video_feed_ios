# 📹 Video Feed App (iOS) – The Ultimate Video Experience

This is a **Swift iOS video feed app** built using **Protocol-Oriented Programming (POP)** and **MVVM architecture**. It delivers a **seamless, high-performance video experience** with **Cloudinary’s video streaming, Adaptive Bitrate (ABR) optimization, and on-the-fly transcoding**.  

With a **smooth vertical scrolling feed**, videos **instantly load and auto-play**, ensuring a highly immersive and optimized viewing experience.

---

## **🚀 Features**
✅ **Full-Screen Video Feed** – Each video fully utilizes the available screen space.  
✅ **Auto-Playing Videos** – Videos automatically play when visible and pause when scrolled away.  
✅ **Looping Playback** – Continuous looping without flickering or buffering.  
✅ **Cloudinary Video Optimization** – Real-time video adaptation for optimal playback.  
✅ **Adaptive Bitrate (ABR) Streaming** – Ensures the best possible video quality based on network speed.  
✅ **Smart Prefetching** – Videos preloaded for instant playback without excessive data usage.  
✅ **Efficient Video Compression** – Optimized transcoding reduces buffering and improves performance.  
✅ **On-the-Fly Resolution Scaling** – Video quality dynamically adjusts based on device capabilities.  

---

## **🛠 Technologies Used**
- **Swift 5** – Modern and efficient coding.
- **UIKit & Storyboards** – UI is built using Storyboards.
- **AVPlayerViewController** – Handles video playback.
- **Cloudinary iOS SDK** – Streams, transcodes, and optimizes videos.
- **MVVM Architecture** – Clean separation of concerns.
- **Protocol-Oriented Programming (POP)** – Modular, reusable components.
- **UICollectionView** – Custom layout for smooth vertical scrolling.

---

## **🎥 Optimized Video Delivery with Cloudinary**
This app leverages **Cloudinary’s powerful video optimization features** to provide the ultimate viewing experience.  

### **1️⃣ Adaptive Bitrate (ABR) Streaming**
- **Definition**: Dynamically adjusts video quality based on real-time network conditions.
- **Optimization**:
  - Cloudinary serves **HLS streams with multiple quality levels** (`360p, 720p, 1080p`).
  - The app uses **AVPlayer with Cloudinary’s adaptive streaming**, ensuring **lag-free playback**.

### **2️⃣ Smart Prefetching for Instant Playback**
- **Definition**: Prefetches upcoming videos **without overloading bandwidth**.
- **Optimization**:
  - Cloudinary’s **CDN caching & preloading** minimize network requests.
  - Only the **next video is prefetched**, reducing unnecessary data consumption.

### **3️⃣ On-the-Fly Video Transcoding & Compression**
- **Definition**: Dynamically resizes and compresses videos to **match device specs**.
- **Optimization**:
  - Uses **Cloudinary’s `q_auto` & `f_auto`** for **automatic format & quality selection**.
  - Reduces **file size by 40-60%** while maintaining high resolution.

✅ **Result:** A **lightning-fast video feed with minimal buffering** and the **best possible quality on any network or device**.

---

## **📂 Project Structure**
