Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A652ED39
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767711; cv=none; b=i3XhFDRu7wtn15roKPvPqZ243AzAKhDaa9GhdefLBkj8zP5mWhEdW1V/hAyWk/Z+fkHm2BWEue4swctisBOZYf/WMd/QIAGAsCZltBD9gbUbGhMgI5vL8aoDaZTCxQ9WEZ0U4SmXPv+1lMViQe/vIrHgEcufqva/xv+wLTZKv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767711; c=relaxed/simple;
	bh=hCt8RfFDNnfDD7Z4MhN/gVhkVJMx6mKfaNhEb0XUMbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CyrL7d3Vr99x0ZsnjHi0R1aJfBS+u8MAvAn/EuiJwI0dZdPd9tdXcHZFao2CForPc5kvOrAMV6MSzKM9YYb2jAf7mGFJXvs1ams40NeT/IzsOmS5B8uhBDxhx8z89Z8EjgRxVc7enYCi92xfuh5vO8eaf7/BVXGKCxMRVuSDPZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ab1kIi+F; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ab1kIi+F"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so6580875e9.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789767707; x=1790372507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWnkCWkXNXciq3jXvBPGD+9vXB4RTRQg9E2OELK+XNk=;
        b=ab1kIi+F3WtfwIKdBwcEP11dBYC3Vmt7s6pSiE71dfqcbrIzmFhtkEh7cGgiPY3INg
         EcuvIgPf/7ikRd3ocHI1A0GC16lyMS7gEfwVvLoMVl4085u2V2IT6yBBwv56lQSkuY0g
         145APlDmU0Izl4dmpcG7wNtbXOxlAGX/UUF96tv8Lt7DnNq2MSMjksQ+4zyN797ULYH5
         TYvTlWbPMec3+hpmA8syzpXemEjnxPToNnI5g9ccVNIb2h9sOlV3TxjACYAJ/IExHEv/
         8lTZiRGpSmr7jIMvvS20/8B5nTPe+9Az4bJ71dm28CNeIJ7GrLSaiFZrk9/6Pwv91L7F
         n2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789767707; x=1790372507;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SWnkCWkXNXciq3jXvBPGD+9vXB4RTRQg9E2OELK+XNk=;
        b=wPSf/VYqAlMGmuz86/EWT2cLlIuQnhFzYW7tzjywQ6OY1OotQ+yK6u2hJCXBZRHQjf
         +B0qw9R7o66Muq8RHnPLBVgDk424i+2QzdpZ7TskGZttwohg/rVMX8Pbv9lxjPNdVGU9
         30Bo5s1f9hHMhPasjdsGfhoW7AGMJ1vLWYYNwwuQUR1k5xtEay+xP3l+qiWxyiM7zNRN
         Ay28a8yHo0X+VmqG7/vf50GpK8SFLuKJk5ZFwUtruDPQmBqKQajb5FgWkXCr41Pyilld
         LFMSyalu306qNyFrqdKiZbQmVfbZPj2yJqi9S37sf7AVNQrNc/fVQFid1twrKu0h/Wqt
         k/HA==
X-Forwarded-Encrypted: i=1; AKwUvByFmCXCCtCyadT4RZNMCsntfHCxUzSwhj8CGXe1OOxQs7QXIT0d2tKRA60438IiuQCLduMIcXx9mxi0vQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nXLEV+S5U1BLx8OvauLMFaPT8jc1uhjCVk8dtWn2DeVWH4ugxH
	a6kzxRz2kOH+9o9b/7PZyC//TApQDCE9v1OSQ5iXQuBVz1rbdHrBRoYG
X-Gm-Gg: AYBFou0IGMP9015w23K/JQH2IqkYp3MOAbG4ONouHKEmpAyMDd1O4Kxfg7ZFELiYbML
	chSVTQ9wbbg70rJWMOL3QtGYa1CyEjn5xVzrGEMaq9nxH5zJ10qgTPqog7vhGE2LG9i1gbKgOGL
	KQJxrZJb/suU40YI/nU/2wIlFxX1nZ8pRJL4hZC8+brlJ7a6cpwC/CVj8JU5MdwSp28Un9FnwCw
	SdB1aFtBB+DZzOTKYXBqrz7pHMhYnhz1S4WfSfj6pTm031fNRrAveR6HktfxZM5quBwCoA0qrVD
	1AEUn7AFaUdHjM29Q5KmgModjcGN2AhLWFRBi1Sc90VzdFn3NXYTkfiXFx5sls0UJPTxues0uA7
	7jLKM0TRilP3wPOiXjoAvkyeWvYyaS6lUoUuq5YNXLTJeuIHCA2PdTk6L4auIkMelq4o4yeMJfp
	eL2ThHbjsUl5z6d+erZngk7iMN51vJPusT73uhI3OVo1X8JqtZM7r22njJl5ktOq96vyv2wLRno
	vZSN+Eiz5v2dfubR6Zd0A==
X-Received: by 2002:a05:600c:548c:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49fc584fee0mr52180715e9.26.1789767707302;
        Fri, 18 Sep 2026 14:41:47 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068059sm22631565e9.5.2026.09.18.14.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:41:46 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove ia_css_circbuf_t typedef
Date: Fri, 18 Sep 2026 21:41:32 +0000
Message-ID: <20260918214132.1135549-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove typedef ia_css_circbuf_t and use struct ia_css_circbuf_s
directly, as per kernel coding style (chapter 5).

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../base/circbuf/interface/ia_css_circbuf.h   | 37 +++++++++----------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 28 +++++++-------
 .../pci/runtime/queue/src/queue_access.h      |  2 +-
 3 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index fbcd73b71..de49bf9cd 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -23,7 +23,6 @@
 /*
  * @brief Data structure for the circular buffer.
  */
-typedef struct ia_css_circbuf_s ia_css_circbuf_t;
 struct ia_css_circbuf_s {
 	ia_css_circbuf_desc_t *desc;    /* Pointer to the descriptor of the circbuf */
 	ia_css_circbuf_elem_t *elems;	/* an array of elements    */
@@ -37,7 +36,7 @@ struct ia_css_circbuf_s {
  * @param desc	The descriptor set to the size using ia_css_circbuf_desc_init().
  */
 void ia_css_circbuf_create(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     ia_css_circbuf_elem_t *elems,
     ia_css_circbuf_desc_t *desc);
 
@@ -47,7 +46,7 @@ void ia_css_circbuf_create(
  * @param cb The pointer to the circular buffer.
  */
 void ia_css_circbuf_destroy(
-    ia_css_circbuf_t *cb);
+	struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Pop a value out of the circular buffer.
@@ -60,7 +59,7 @@ void ia_css_circbuf_destroy(
  * @return the pop-out value.
  */
 uint32_t ia_css_circbuf_pop(
-    ia_css_circbuf_t *cb);
+	struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Extract a value out of the circular buffer.
@@ -74,7 +73,7 @@ uint32_t ia_css_circbuf_pop(
  * @return the extracted value.
  */
 uint32_t ia_css_circbuf_extract(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /****************************************************************
@@ -135,7 +134,7 @@ static inline void ia_css_circbuf_elem_cpy(
  * @return the position at offset.
  */
 static inline uint8_t ia_css_circbuf_get_pos_at_offset(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     u32 base,
     int offset)
 {
@@ -163,7 +162,7 @@ static inline uint8_t ia_css_circbuf_get_pos_at_offset(
  * @return the offset.
  */
 static inline int ia_css_circbuf_get_offset(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     u32 src_pos,
     uint32_t dest_pos)
 {
@@ -188,7 +187,7 @@ static inline int ia_css_circbuf_get_offset(
  * TODO: Test this API.
  */
 static inline uint32_t ia_css_circbuf_get_size(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -204,7 +203,7 @@ static inline uint32_t ia_css_circbuf_get_size(
  * @return the number of available elements.
  */
 static inline uint32_t ia_css_circbuf_get_num_elems(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	int num;
 
@@ -226,7 +225,7 @@ static inline uint32_t ia_css_circbuf_get_num_elems(
  *	- false when it is not empty.
  */
 static inline bool ia_css_circbuf_is_empty(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -243,7 +242,7 @@ static inline bool ia_css_circbuf_is_empty(
  *	- true when it is full.
  *	- false when it is not full.
  */
-static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
+static inline bool ia_css_circbuf_is_full(struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -261,7 +260,7 @@ static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
  * @param elem	The new element.
  */
 static inline void ia_css_circbuf_write(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     ia_css_circbuf_elem_t elem)
 {
 	OP___assert(cb);
@@ -285,7 +284,7 @@ static inline void ia_css_circbuf_write(
  * @param val	The value to be pushed in.
  */
 static inline void ia_css_circbuf_push(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     uint32_t val)
 {
 	ia_css_circbuf_elem_t elem;
@@ -308,7 +307,7 @@ static inline void ia_css_circbuf_push(
  * @return: The number of free elements.
  */
 static inline uint32_t ia_css_circbuf_get_free_elems(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -320,24 +319,24 @@ static inline uint32_t ia_css_circbuf_get_free_elems(
  * @brief Peek an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
+ * @param offset to the element.
  *
  * @return the elements value.
  */
 uint32_t ia_css_circbuf_peek(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /*
  * @brief Get an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
+ * @param offset to the element.
  *
  * @return the elements value.
  */
 uint32_t ia_css_circbuf_peek_from_start(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /*
@@ -356,7 +355,7 @@ uint32_t ia_css_circbuf_peek_from_start(
  *			false on failure
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     unsigned int sz_delta,
     ia_css_circbuf_elem_t *elems);
 
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5a..203856e24 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -24,7 +24,7 @@
  * @return the oldest element.
  */
 static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb);
+ia_css_circbuf_read(struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Shift a chunk of elements in the circular buffer.
@@ -36,8 +36,8 @@ ia_css_circbuf_read(ia_css_circbuf_t *cb);
  * @param chunk_src  The position at which the first element in the chunk is.
  * @param chunk_dest The position to which the first element in the chunk would be shift.
  */
-static inline void ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
-	u32 chunk_src,
+static inline void ia_css_circbuf_shift_chunk(struct ia_css_circbuf_s *cb,
+					      u32 chunk_src,
 	uint32_t chunk_dest);
 
 /*
@@ -60,7 +60,7 @@ ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem);
  * Refer to "ia_css_circbuf.h" for details.
  */
 void
-ia_css_circbuf_create(ia_css_circbuf_t *cb,
+ia_css_circbuf_create(struct ia_css_circbuf_s *cb,
 		      ia_css_circbuf_elem_t *elems,
 		      ia_css_circbuf_desc_t *desc)
 {
@@ -84,7 +84,7 @@ ia_css_circbuf_create(ia_css_circbuf_t *cb,
  * @brief Destroy the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-void ia_css_circbuf_destroy(ia_css_circbuf_t *cb)
+void ia_css_circbuf_destroy(struct ia_css_circbuf_s *cb)
 {
 	cb->desc = NULL;
 
@@ -95,7 +95,7 @@ void ia_css_circbuf_destroy(ia_css_circbuf_t *cb)
  * @brief Pop a value out of the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_pop(ia_css_circbuf_t *cb)
+uint32_t ia_css_circbuf_pop(struct ia_css_circbuf_s *cb)
 {
 	u32 ret;
 	ia_css_circbuf_elem_t elem;
@@ -112,7 +112,7 @@ uint32_t ia_css_circbuf_pop(ia_css_circbuf_t *cb)
  * @brief Extract a value out of the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_extract(struct ia_css_circbuf_s *cb, int offset)
 {
 	int max_offset;
 	u32 val;
@@ -162,7 +162,7 @@ uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
  * @brief Peek an element from the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_peek(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_peek(struct ia_css_circbuf_s *cb, int offset)
 {
 	int pos;
 
@@ -176,7 +176,7 @@ uint32_t ia_css_circbuf_peek(ia_css_circbuf_t *cb, int offset)
  * @brief Get the value of an element from the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_peek_from_start(struct ia_css_circbuf_s *cb, int offset)
 {
 	int pos;
 
@@ -192,7 +192,7 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * Please refer to "ia_css_circbuf.h" for details.
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     unsigned int sz_delta,
     ia_css_circbuf_elem_t *elems)
 {
@@ -260,7 +260,7 @@ ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem)
  * Refer to "Forward declarations" for details.
  */
 static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb)
+ia_css_circbuf_read(struct ia_css_circbuf_s *cb)
 {
 	ia_css_circbuf_elem_t elem;
 
@@ -280,7 +280,7 @@ ia_css_circbuf_read(ia_css_circbuf_t *cb)
  * Refer to "Forward declarations" for details.
  */
 static inline void
-ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
+ia_css_circbuf_shift_chunk(struct ia_css_circbuf_s *cb,
 			   u32 chunk_src, uint32_t chunk_dest)
 {
 	int chunk_offset;
@@ -289,7 +289,7 @@ ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
 
 	/* get the chunk offset and size */
 	chunk_offset = ia_css_circbuf_get_offset(cb,
-		       chunk_src, chunk_dest);
+						 chunk_src, chunk_dest);
 	chunk_sz = ia_css_circbuf_get_offset(cb, cb->desc->start, chunk_src) + 1;
 
 	/* shift each element to its terminal position */
@@ -308,5 +308,5 @@ ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
 
 	/* adjust the index "start" */
 	cb->desc->start = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->start,
-			  chunk_offset);
+							   chunk_offset);
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d62133a8f..d9b76b70d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -47,7 +47,7 @@ struct ia_css_queue {
 	u8 location;    /* Cell location for queue */
 	u8 proc_id;     /* Processor id for queue access */
 	union {
-		ia_css_circbuf_t cb_local;
+		struct ia_css_circbuf_s cb_local;
 		struct {
 			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
 			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/
-- 
2.43.0

