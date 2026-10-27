Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067581;
	b=MoLkf1VsA2sDDjKNzxgojJPU9yXfYTUBmoqWsWtA1vgyG0tFW2tB9ivIY1BhYfohHtGj
	 5XwamZYthSy6gz31OpiD2nxnfAOdarv9foO0ntkNZgUpcVZmctqVhOYbCb36H25L2G2Sr
	 Fw8mqNej1iKuj1jiirg2mPfj84UJBckJY5w6tNZZ7bok0qxFdladmGE5lqeIrHIqtgXof
	 Tb44qHM4Mc+S3bXlV4cs6golc+Dag0AuZ5DjEj2zMZCQPbVCERLdHNYMffPKVEc4x9iho
	 D72fSfOTwZiPg/4OEsX+haGgq7d9K4nU1fFbyKVJSYxWpt0ZJeCxIhz/w888zRUXriA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=02DoDBYXgSGZJPDz/u6weuFYgJ6DKUvigv3cQqnkKS4=;
	b=ckfisUSwADuADgzE4shec4ZAV6+FL7wo9yv6I9PhNOcVASysf4jkmYLX82F8rPlhrEKF
	 +hhSoYMKw1k/ess3rHpgX/11o9qGC9vhzvmp2F8EvsRIT1sU/8DZi7eodmLgW9nIaTiQ8
	 /oVulQtPomdClfpQKd0JqflWYFxRAlwZPYacAV47kGjEQjz1JAg5WtwWcpARp7tJhRxn0
	 NTl/h30hGu4oty+V9Z9+SVnvrHeA+DbYviaqtSSFMi2BSs9SpgyXRj5mJ1he/J1KwSKEM
	 m/87DZWLLtxxcTFodSGXrh/edwnCM0FMrgJWxCal/Iei3zeeUV0YzCblVHd6SowOPPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EW9DbpFb;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD6606A335
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBD6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EW9DbpFb
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67992884b02so2384925d50.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067579; x=1793672379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02DoDBYXgSGZJPDz/u6weuFYgJ6DKUvigv3cQqnkKS4=;
        b=EW9DbpFbHKXQXQ/RHiPbBwK9v7nJzRpsH/aW9voJvE8LB+rbn/4jh3R1tuFLrAupKd
         BRRSD4ZCf2wdn10g5zA+UPiaUMsrR59KGryWUI6V93gttNBrVFPJFJrlpzgXN9504ooE
         16S4h5eLIStCNFh68H7/NLjHayQkj61q736rOSmk6KxjOKQ8vcTW6ZF8KNPWhnDlsJG7
         3Hk/t0y4PV6FI/i7OMWath4r0dax0yuaFkLQPhnrKUJ989NYyt3pFsmExZhrQjbuqZAi
         f1rIjkwLKycTzwCPFekufS4yY2605Dd4fx6U7/MUTf754BkZUCqenbqWB88kK6eDTMZA
         7cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067579; x=1793672379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=02DoDBYXgSGZJPDz/u6weuFYgJ6DKUvigv3cQqnkKS4=;
        b=ow5gv7KLRmhQFfJu24HI7fOUpbMIkNjcs+cUpa07uwEW1QFHYN3mGU1zo0JWFWlm7H
         XwCFQ9WeNIJqWSMnDRuT8qlas8o3IhwAp5WCZYl3EthsgI9IUUZpFnbN+S5JWYh3/73U
         G7GeF9+aUb/iDBtUrovdBBCBwMcDYX3XwPiyODqJc3B6i7JzdBFzG54v21qFyblcsu3D
         5xOlrJrZ7w6GSyg4/7ZsX+RIVEhVRvUmHXwsiwmw9Q/Zlq8Ep7bKZkbWv7Ebm4RPCLHB
         Nu1FFVqyinlj/xesSFVkOz6338tT8aPgZhAQRwifb7iENHSUqEc1KBC6n89AuY85AZ86
         kAjA==
X-Forwarded-Encrypted: i=1; AKwUvByhCwrpA3S3euadLxSvVKZz5d1EtFYZ+F2gBFR7m7mODI1J9cDFNowkHtgI8Foaxd5WkyFqHJvWQcFFuQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSQR9UB87I19/+rJoGhraav9oI4fmKdjkGz1t113ieSdn0EBQw
	VhSA1e6DcC0LSouajJ+oh551UFxOQ5YY8H59DcAgvlXLDT5FY12Vf+4y
X-Gm-Gg: AYBFou2War+rqCl1txEwkZy0qFxbggCW7IO7Y1GCJcwHcufvXEN0yEvY11D+cJfftm6
	MUqxm4nVL6kayTaIdsy3OQqLKn0czY4slEp0+sICqDaQ+SFlCstwBOcS4IgayvhNkv2nD+yTaE7
	e6EJaO/ACAtW6DvFOEPjlGWcPaaZszSAEJE7Q/RuVueKD9g3nxhD7YxnuRFfgM/LK8snB8GvuIM
	5mhuB93Ujmn47JP8JNQk9BETC6B1dsodq2WY/YD6fcEsx0Cf45wdQjAk2CNglOHwA9cgaSKzn1u
	SDPy6zm8GvEs5HoU/29xjeEkFCdcJwwGlnSysGnDPLuZoXVYcIB/MQQlBhXn2cMouOgXprt0tIm
	sTmnF3WMSHV4kdLtSjHA4fKgJNWQtq4aWoY8DUIqm+0cHAh6rtPFwL6W/v3+hGdsqGHr4P3gSh2
	cKO8Fq+2TY3j1na7/tROvbHr/N6+7xaWNRYObFp6cEwx/+teQj4VZGl1IqsPdapyjnsYFAXQ2d6
	olVLYZ1cbnsWO0146N/asZFy9EHfPf43M06OOYzFnRgbwE9Ecv/aGqzx1Q+PUr7SveC+GVe+Cgu
	CtObpO/TkZ2Hh4OzaqoXPirnRpZQSV2Ctw==
X-Received: by 2002:a05:690e:43c6:b0:675:449d:3d74 with SMTP id 956f58d0204a3-67a6c3e6b46mr593353d50.92.1793067579275;
        Mon, 26 Oct 2026 19:19:39 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a46235de1sm4219122d50.13.2026.10.26.19.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:38 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 3/5] media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
Date: Mon, 26 Oct 2026 21:19:32 -0500
Message-ID: <20261027021934.22113-4-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027021934.22113-1-ccortner@gmail.com>
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
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

iris_vb2_buffer_done() and iris_vb2_buf_queue() queue V4L2_EVENT_EOS and
mark the m2m context as stopped for every capture buffer flagged
V4L2_BUF_FLAG_LAST, including the one that ends a dynamic resolution
change. In the stateful decoder interface the (deprecated) EOS event is
part of the drain sequence only, and a resolution change is not the end
of the stream: a client that still acts on the event, like ffmpeg's
h264_v4l2m2m decoder, stops decoding at the first resolution change in
the stream. And since nothing in the driver clears the stopped mark
again, the EOS event of the drain at the real end of such a stream is
never sent.

Queue the event, and mark the context as stopped, only when the LAST
buffer ends a drain, that is when IRIS_INST_SUB_DRAIN_LAST is set. Both
HFI generations set it before they return the LAST buffer of a drain,
for the decoder and the encoder alike.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
Reference only, not for merging (no Signed-off-by); see the cover
letter.

 drivers/media/platform/qcom/iris/iris_buffer.c | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c    | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..ff2a1b331ac2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -913,7 +913,12 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	}
 
 	if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
-		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
+		/*
+		 * Only a drain ends with V4L2_EVENT_EOS: the LAST buffer of a
+		 * source change is not the end of the stream.
+		 */
+		if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST &&
+		    !v4l2_m2m_has_stopped(m2m_ctx)) {
 			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
 
 			v4l2_event_queue_fh(&inst->fh, &ev);
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8faf709c26c1..b820b3e43910 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -324,7 +324,9 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 			vbuf->field = V4L2_FIELD_NONE;
 			vb2_set_plane_payload(vb2, 0, 0);
 			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
-			if (!v4l2_m2m_has_stopped(m2m_ctx)) {
+			/* EOS ends a drain only, see iris_vb2_buffer_done() */
+			if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST &&
+			    !v4l2_m2m_has_stopped(m2m_ctx)) {
 				v4l2_event_queue_fh(&inst->fh, &eos);
 				v4l2_m2m_mark_stopped(m2m_ctx);
 			}
-- 
2.56.0

