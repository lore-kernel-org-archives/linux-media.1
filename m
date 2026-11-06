Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969704;
	b=r0iJ4SHaa7UlPQeknrGJPjq4dwivb9JeIX+Y/xkou7pFYfID3ReO1/IzeBLO+LQF+ba1
	 FDa7bYaIPCZVzEYBw/tiZ7btobEwuP195OvZSt4Y/+80m7K017YtjNL4AKQP6BzGvWnUW
	 IlHJF/R/FWO00M3lvjTaF8W3v3Hak8SuQEp28SWAhA1W1RP+2D+ZKewrVopMNC7Xf58tA
	 H7/Nzl/ccaqKhpUL0jRJ52bjJaWai4h8dhs7FUEzo9g/iy5WDRJ0ngoiFDVVn0hUk9B9g
	 /CbqkSMEHQLG3VVdUUA+YsQLqzZ8yoT90EJQao93zW4+E20faSkFNe6mavmUIkYX2Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qls2hf7ByM4hM+XkcMA/NLbWocdRZ/KPf+vWTT7+kUA=;
	b=DsBrL5tUWdrD3KKSF4mcRUtG84gCiLGAZzcd5alXvcfXO3aPTFuANvg1iDADCMIjAb7k
	 aIayL5pl812J3cxlYpoGuhy68zmPLJPlKPIwcrO2B8aGL0qUc4k0lDcV3rod+HWGIEApn
	 0k50FL7VC0vC3pqjN4wT39Et34TCtojkepo/1FMzwAZUfaX8ARag1+tnY/49iNkeE9ZKS
	 0GE0/f1io/pI72JAKIAg1YL/JFIP00QbuDPB8IFNPdvtd8WstVO6AkuwfIIRlZoTn2QOa
	 UeRFWVsp/rE23Gq4AkvKEjmHeu4DZuGKn4F+eBavO76nfpOwBXDa2dwjUX+J/GlbwOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1eftIF+;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1C0606A330
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 12:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1C0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1eftIF+
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so497494eec.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969703; x=1794574503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qls2hf7ByM4hM+XkcMA/NLbWocdRZ/KPf+vWTT7+kUA=;
        b=W1eftIF+2S8Yv5ozKua+UAws3pwMOzIfPYjwEUkT70ZzInkq5P8NHbTzaJN5OGNMEA
         oPSeO/4trFAsPXsqTrqhkO14wk9HezSdnnWJ9U0gBiIBeYejxhQeQR/VV03Djo6dX8j8
         F7tCCaWlIfwzr7+CTN646YzPd7VbdI+9uUTnzhWw0HPFoI+UhYlav6WnBBniKi8/WeOC
         6cQyQvK3QfNk790s5P2yWey7oK4ok3WamfNGVXKRR0VbMvU8jc4e3XCvkHuFgo2nbOpw
         3j9K/S/2puG3cWvF+ZOAkMXQoUirjbTncUUjFw5WwZdQlU7buayXknkTcgV76jp8WE8j
         6riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969703; x=1794574503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qls2hf7ByM4hM+XkcMA/NLbWocdRZ/KPf+vWTT7+kUA=;
        b=SLfcsVP8TUssab5VQiYZ8LwBLoI/KJU67gUIykrcF3TJlE8XycwsnzCJUTlwvrTD2/
         +LqyrI6k5n9APxYgoloaokgfzuCu6l1vZtm/Kqy0o2D0ADbI7Z0m5bXmZtjCGQSvcAkn
         c3kuq+2rzMu7piUMa76LMn6iuxTVwkW/hvlbqZuz2VofJ3UtTm58E88zZJLwcYCz4col
         u2AzgJczNWrQ66hamh/OlrgAzxUH4bXhjto7Fy5zi3uGiGOBtuD0zn32comomSeoTw+F
         iK/bL+UJurRgdiYd19NYkH66AkbyB5cEA3kLzUYLYITR+rYwZyK4k7rcEqYm4PFCBz+e
         IO1A==
X-Forwarded-Encrypted: i=1; AL+hErF5q+E+e97IGxcFLhJAbk7HeNMS6uH5I+URBDwYWmiHfhoNprroook+FcHrXNMJRNhoIqKi2yCPhHfE7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1hvG9zzdwxhkjF8ZmtH6CTMaLVTNIpIqoWjD+jhBg1/q+F1F3
	Jc/+WAm05w+azlUesbS6PHXimUPHHip7ygkKl50EBx74WpnO/HUf05COP3zxMUsv
X-Gm-Gg: AYBFou2EYlQ1vKxJz0Z3OPwLAeLT+gjRxBTxEAc49i9OWywjGhf5LtJ3uYyc4Jj6rhe
	uXUvGOqW/6oFCviq0v1YsnP2qQHlwf2XCS5bSM9WATrTxi0Rqa+mAxhOIuqgj5hKlTaHVeZEybW
	FYd+fh+eFygMUoa+i/ZB7PYxvYUVEvf/g/rOWsR9ySWYsc4GvTDDpMidwkQ7rveh7Kg/rb0qupS
	WLQsKVvHfBiyKI1HRHQfhjmrJqdN6/A6GozbRs2sJPxG3pXBQqS8JXt3BPTS/whC0cNfNA3mSJp
	38q8iIftK8GdRaD9OAOM+5WsQgvVpVMtwy9CVp2Cb2ySSXQgeiiEg/kGqXhdP3HE2Po5Lwcuf4R
	fks7ktZl4+VyJEA9v0RRxa3aFTlQ8QF+szDKCCgZCRHsbymqDifSZOzPs71v29YjSeQn5+ZLprP
	aIrKEF08zceYUHTt79u3uwdz1pAEasoi3Cv8IbBsiei66qElcA5FDVayDrux43RBCJcZmpbLb8b
	1b4dxqxC1LV3r9Wql2UvmpZEor6qzpW7kGvHptd6dTpXdG70Yp+OsbUC357NFLIPXuhkmPQrNdf
	zHDjLuMLzn3n4yEQD8Dgc3silFPX0GZAl24eDAc3HMSLiBiw
X-Received: by 2002:a05:693c:26c9:b0:369:36c9:5848 with SMTP id 5a478bee46e88-36f76022c16mr3418743eec.12.1793969702797;
        Fri, 06 Nov 2026 04:55:02 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm6763369eec.18.2026.11.06.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:55:02 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] media: coda: fix out-of-bounds read when parsing H.264 SPS profile
Date: Fri,  6 Nov 2026 21:54:55 +0900
Message-ID: <20261106125455.2612376-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

coda_sps_parse_profile() scans the compressed OUTPUT-plane buffer
supplied by userspace via VIDIOC_QBUF for an SPS NAL unit and then reads
the profile_idc (buf[0]) and level_idc (buf[2]) that follow the NAL unit
header byte. Neither the NAL scanning helper nor the final dereferences
are bounded against the end of the payload:

  - coda_find_nal_header() dereferences *buf++ before checking buf
    against end, so it reads one byte past the payload when it is
    entered with buf == end (e.g. a zero-length or start-code-terminated
    buffer).

  - after the SPS NAL unit header byte is consumed, buf may point at or
    near the end of the payload, yet buf[0] and buf[2] are read with no
    check that three bytes are actually available, reading up to three
    bytes past the end of the payload (and past the allocation when
    bytesused == plane size).

A local user with access to /dev/videoN can trigger this by queueing a
crafted H.264 bitstream buffer ending right after an SPS start code and
NAL header byte, resulting in an out-of-bounds read (KASAN splat /
possible crash).

Rewrite coda_find_nal_header() to bound-check before each read and
never return a pointer at or past end, so the caller can always read the
NAL unit header byte it returns. After consuming that byte, verify that
profile_idc and level_idc are inside the payload before dereferencing
them.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2:
 - Move the end check into coda_find_nal_header() so it never returns a
   pointer >= end, and drop the redundant "buf >= end" check from the
   caller's SPS-search loop (per Philipp Zabel).
 - No functional change to the profile_idc/level_idc bounds check.

 drivers/media/platform/chips-media/coda/coda-h264.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-h264.c b/drivers/media/platform/chips-media/coda/coda-h264.c
--- a/drivers/media/platform/chips-media/coda/coda-h264.c
+++ b/drivers/media/platform/chips-media/coda/coda-h264.c
@@ -19,13 +19,13 @@
 {
 	u32 val = 0xffffffff;
 
-	do {
+	while (buf < end) {
 		val = val << 8 | *buf++;
-		if (buf >= end)
-			return NULL;
-	} while (val != 0x00000001);
+		if (val == 0x00000001)
+			return buf < end ? buf : NULL;
+	}
 
-	return buf;
+	return NULL;
 }
 
 int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb)
@@ -40,6 +40,13 @@
 			return -EINVAL;
 	} while ((*buf++ & 0x1f) != 0x7);
 
+	/*
+	 * profile_idc (buf[0]) and level_idc (buf[2]) must lie within the
+	 * payload before they can be dereferenced.
+	 */
+	if (end - buf < 3)
+		return -EINVAL;
+
 	ctx->params.h264_profile_idc = buf[0];
 	ctx->params.h264_level_idc = buf[2];
 
