Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86097423E9C
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555816; cv=none; b=eH6Bv+9/aIj1sbmVvZbk9vjVcT2ahyx2bETIJD0NXG7iIvodnQhhJ9S+9qx6WXe6GOAmHopLRCpUgWxUgX3wQUzi0LC327fPTnDYc/oX44m+sVhfE7lUq+Y9WzOuMiCUymh+LXRB63L2n7d7zU4oW0VbWBlzNpijWFNe3qd3CnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555816; c=relaxed/simple;
	bh=/6LUW+j3zISrC3zDmKTf2zpa7V849gZv42gCk7LOMFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=begDbE2/odBVgIeGEez13T8FqBVCoRZIVBDMUcs1ESAZfObisi8xLGZXH9j4WKaVUhLwyTKVzCl1CIDUElD2WpEHx/KxjR8uaNeEZCkg6LLQpAHNzC8DkfSuL7w9Sdz1vdJzZHp8T9083SIhVY3ckNMW6Ds/u/1yMAM00Am+5mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjCGqSyF; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjCGqSyF"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1649612eec.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791555814; x=1792160614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj5ZGPYDc8+BnuBTFqzv+vqOHduFDbEPmpj8Sqnl360=;
        b=hjCGqSyFNHYM0cVzrncPkI+H7hZLfcNe0/gNtA/H58I00uiMzg7qzmSkxLj9b+4jAF
         F2Kray2RN4UgdB31bkxac+nKT5JL+TJNc1zyM4tpyplyZcvyY+ReKipYSMOBWf0BBrl2
         NEsvuuU32XS6nv1cUcWn/bHWUfCmx0LOZJ30ewPYtYKu42Z3zvCVI4mdpn4HfJkdzwqA
         YBN4n/iimsNLIBw7EooLDTULTU28g/pdUAxxVxr+d3HuqRuvwt2BOlu0DfDv12HjS10n
         elkFLLilk1nj+DtTsXfz12R8XQG0dPohSNSEh0BJ63szg3Cr0WWDUWjqVE2UrFa0xGdC
         9gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555814; x=1792160614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj5ZGPYDc8+BnuBTFqzv+vqOHduFDbEPmpj8Sqnl360=;
        b=n0penx2gIhLupAVJ/knx4uwshuRSGwSXLaZDmfk8XYf3eGjq8mvnELOsulkyTdrSan
         FIHj7c52tz2uDjtRhFqUX558OBePPm+CLeIh+vFO9DcX8nW2/wKHz3lKnHt5cqA31bY2
         iASi3/QtGwqjzK2aAZvgLNcNIO0ZYzA81RXZ2BCbJWxrqP8S47cuupEYPQ3y/bfn3FYu
         exWnW36In3YnPVYKifCV8JjBxieyT34A5EU3yU5DBlg2JSfQ5WQMKSbj+oSeB3rnTJcF
         237jqaR4Rx+ryJGGB2Q2vE7FVEytj9HCVs+Iz9eTBFBCc2D/Ja7t7GgvmfcmDzwbJ4ce
         ynFw==
X-Gm-Message-State: AFq9FYKwmND/vIKEJxVelpZoLZH5X7HBRph6rJzocaOGTUcTkW0afc0A
	oRkeCRN3goaCuYAmmlZtJOm8MSJs9671AP3HwfXebZgALr0rGQsAQx3rzIrpCg==
X-Gm-Gg: AYBFou1Cx13MY2DCtsHdTlOSOWtcN3s5lE0AWBpmcGiyZDQN5649wuh52bNr41IDFo4
	znmp5Bgjc3B0dBeB+1KkGeKSN8GWXfzg7aqlYnmNmTv1mhPiHc7N2F+V4vr+tbE0rSsBxdo02PO
	JTpCHs4lWtHicqwM4eLPVOVjwd1yks3vBf1BZ9wPyJ3kyq05kiUnnq8ThlKExzWR9Efw3rzfDBi
	NPJgkWhdlPbl4eWidpC9qkhQTHEvnJm3MEVmJQNMZxN+urgRQSOD4SdQ92wYz1ojILAFRKiXnhQ
	xinm8C1VPmXOVOhJsf2gun6o9urlWzGkbHvlM7WFMS8H+/p/TCDN0DOpTSmhPb4iTLC3X+0DDvk
	hnIRqxmb2oC/XWMCS4AbNsh0veA/oW7GO9K49tDScbpGtOeDW861ijnIKAexesnmNJWB3Ug6jLa
	/qvJv51EVKU7VK1x0SOVzMllTEk02lbcIaeJxn48eW/H8oa4qWyzEGRC1++SiGgPoNS6kFq+Wf5
	GC7yoV791tB9slodWcnDvQ=
X-Received: by 2002:a05:7301:797:b0:353:7e28:9c58 with SMTP id 5a478bee46e88-3537e289d93mr2932453eec.41.1791555805307;
        Fri, 09 Oct 2026 07:23:25 -0700 (PDT)
Received: from fedora.tail44843d.ts.net ([2406:b400:66:1bba:a266:257f:3c5c:90be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm6534357eec.29.2026.10.09.07.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:23:24 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Slawomir Stepien <sst@poczta.fm>,
	Mirza Ishan Beg <seedandsyntax@gmail.com>,
	syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-core: fix OOB read in dtv_property_process_get()
Date: Fri,  9 Oct 2026 19:53:03 +0530
Message-ID: <20261009142303.166373-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtv_property_process_get() switches on 'tvp->cmd' and, in each case,
writes a different member of the union 'u' in struct dtv_property.
'u.data' carries the scalar commands, while u.st carries the
'DTV_STAT_*' commands, and u.buffer only DTV_ENUM_DELSYS.

After the switch, a single shared dev_dbg() reads 'u.buffer.len'
and 'u.buffer.data' via %*ph, regardless of which member the case
wrote.

struct 'dtv_property' is 76 bytes and union 'u' begins at offset 16:

    u.data      : 4 bytes at 16
    u.st        : 37 bytes at 16
    u.buffer    : 56 bytes at 16 ('data[32]' at 16-47, 'len' at 48-51)

For commands that only write 'u.data', 'u.buffer.len' is never set by
the kernel and keeps whatever userspace supplied to FE_GET_PROPERTY,
because dvb_get_property() copies the array in with
memdup_array_user() and does not clear the union. A large value (the
reproducer uses 1163001896) makes vsprintf() emit "field width ...
out of range" and hex_string() clamp the length to 64 bytes. The
read starts at 'u.buffer.data', offset 16, so 64 bytes reach offset 80
and KASAN reports a slab-out-of-bounds read past the 76-byte object.

The DTV_STAT_* cases hit the same shared print. 'u.buffer.len' overlaps
'u.st.stat[3].uvalue', so the debug output is meaningless even when the
read stays in bounds. The same applies to the clamp added by
60f0618d157b, which writes to 'u.buffer.len' and therefore into the
just-written stats payload.

Fix by storing the point of writing which union member each case
populated, and by branching the final dev_dbg() on that stored point.
Add a local enum 'dtv_get_shape' with values 'SHAPE_DATA', 'SHAPE_ST'
and 'SHAPE_BUFFER', initialised to 'SHAPE_DATA' and set in the
'DTV_ENUM_DELSYS' and 'DTV_STAT_*' cases. The final print then reads only
the member the case actually wrote, and every branch stays inside the
76-byte object. The clamp and the now-unused 'len' variable are removed.

Fixes: 60f0618d157b ("media: dvb-core: frontend: make GET/SET safer")
Suggested-by: Slawomir Stepien <sst@poczta.fm>
Reported-by: syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6102f1c3a0ea8073fd64
Link: https://lore.kernel.org/all/2a5ea27d-445e-4ffe-9447-9d7bfccd4a36@mail.kernel.org/
Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 73 ++++++++++++++-------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 0286da57f..f4b599a1a 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -1342,13 +1342,19 @@ static int dtv_get_frontend(struct dvb_frontend *fe,
 static int dvb_frontend_handle_ioctl(struct file *file,
 				     unsigned int cmd, void *parg);
 
+enum dtv_get_shape {
+	SHAPE_DATA,
+	SHAPE_ST,
+	SHAPE_BUFFER,
+};
+
 static int dtv_property_process_get(struct dvb_frontend *fe,
 				    const struct dtv_frontend_properties *c,
 				    struct dtv_property *tvp,
 				    struct file *file)
 {
+	enum dtv_get_shape shape = SHAPE_DATA;
 	int ncaps;
-	unsigned int len = 1;
 
 	switch (tvp->cmd) {
 	case DTV_ENUM_DELSYS:
@@ -1358,7 +1364,7 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 			ncaps++;
 		}
 		tvp->u.buffer.len = ncaps;
-		len = ncaps;
+		shape = SHAPE_BUFFER;
 		break;
 	case DTV_FREQUENCY:
 		tvp->u.data = c->frequency;
@@ -1536,51 +1542,35 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 	/* Fill quality measures */
 	case DTV_STAT_SIGNAL_STRENGTH:
 		tvp->u.st = c->strength;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_CNR:
 		tvp->u.st = c->cnr;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_PRE_ERROR_BIT_COUNT:
 		tvp->u.st = c->pre_bit_error;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_PRE_TOTAL_BIT_COUNT:
 		tvp->u.st = c->pre_bit_count;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_POST_ERROR_BIT_COUNT:
 		tvp->u.st = c->post_bit_error;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_POST_TOTAL_BIT_COUNT:
 		tvp->u.st = c->post_bit_count;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_ERROR_BLOCK_COUNT:
 		tvp->u.st = c->block_error;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	case DTV_STAT_TOTAL_BLOCK_COUNT:
 		tvp->u.st = c->block_count;
-		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
-			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
-		len = tvp->u.buffer.len;
+		shape = SHAPE_ST;
 		break;
 	default:
 		dev_dbg(fe->dvb->device,
@@ -1588,15 +1578,28 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
 			__func__, tvp->cmd);
 		return -EINVAL;
 	}
-
-	if (len < 1)
-		len = 1;
-
-	dev_dbg(fe->dvb->device,
-		"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
-		__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
-		tvp->u.buffer.len, tvp->u.buffer.len, tvp->u.buffer.data);
-
+	switch (shape) {
+	case SHAPE_BUFFER:
+		dev_dbg(fe->dvb->device,
+			"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
+			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
+			tvp->u.buffer.len, tvp->u.buffer.len,
+			tvp->u.buffer.data);
+		break;
+	case SHAPE_ST:
+		dev_dbg(fe->dvb->device,
+			"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
+			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
+			tvp->u.st.len, (int)sizeof(tvp->u.st),
+			&tvp->u.st);
+		break;
+	case SHAPE_DATA:
+		dev_dbg(fe->dvb->device,
+			"%s: GET cmd 0x%08x (%s) = 0x%08x\n",
+			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
+			tvp->u.data);
+		break;
+	}
 	return 0;
 }
 
-- 
2.56.0

