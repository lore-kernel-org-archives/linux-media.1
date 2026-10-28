Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159019;
	b=GjFW2nZwa6W2BrQ0a/lkSzKrTwOSXjty+T3bVbAbqO/MdR9tCKG5lTTDMjEn3mYyHlFA
	 gBYHeW3yimtgNP9wEKjzXH5aZXchgaNHhj8JLVF3zPV90bK1hMULl4bG0h7IzV0ps/3LA
	 FDJzXLlxElhEExNzCAO2U4de+khxcV1mbrbl8uViu0mCDmCIB5wXZ6Wxkir5JyqZkJWN6
	 qVVTK90LghI4INy66jwybCS1J7JX+pej02cdmtaJTAfaOTs683gM7IEbKJOKu5pdWBr6r
	 If4iYMpmTaXMRomg/E8UHpjAklhtM2wKVNNyvBEvI4RlAfjYYgMB1cpaNGaHLP+7Ubw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r5v5jZxyWxHp2DT8k13H1hTIbLWPE/Nv75WUu874YVo=;
	b=VYf2HyklcT7vffq8xRhH6axAsUfbOJLPg21i9OzTsYlbttqddzZkHu29Pv2QHUVmpbz1
	 b6p/nYbdykbK8skX1NdhrDhfXYHEJOk0/OywV5Ba5nDK+bAZe41w448HTSwl5CEAZj3UF
	 di8qLwmYqVhsnZ7NnnZSsAt1xMPyTufRWoN5jg6tZLmnWAJKfF+/mJ3ojtn9M/KaDkng/
	 tBcWsaN55euh5xzNCcCDc4BVESwA8DqVdwIovl1jq28qyPBAsXD4ppJt0AYCRM6SSr6XQ
	 MRQUevvd4rZcLJihvzfpYFxGFyPGIsvHaOp9RlhrolLG5qVwS5H1IKVyxANL3ByMWrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MS/OC5C8";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC670606A326
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 03:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC670606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MS/OC5C8
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5363c8de563so7516161cf.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 20:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159018; x=1793763818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5v5jZxyWxHp2DT8k13H1hTIbLWPE/Nv75WUu874YVo=;
        b=MS/OC5C8OcvrB8KCupFrL2xOApQoCzr1Gln/rqtrVflwk77bvvGtxKjmfEpOuSvfZn
         EGFWZM1A2REaPAfV89a6YZTbCSlrhvqoTZW0c3oZLd+XPBjAUV8+prd3+ygchhUYikvg
         cKa5hVIE1OOqbgU0l1WEO5PInrk24GaQAvTzDw5vs2WM7nQUlXgtQXgucp/aKVd8fdtH
         o/Fh/9IR4uTxFzrPaOeqls1Xqksn7QRmY5W72fBYiAhV+Ea3r81JPghg01EpFOY8OX+d
         FwsyhJYj2l8OL486tLVrpi3eB809J3Fos0RhPpDE5iWiKCMKxbKDf7K0Cd6/I88avmOh
         sW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159018; x=1793763818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5v5jZxyWxHp2DT8k13H1hTIbLWPE/Nv75WUu874YVo=;
        b=VeBtMIaggfa7jXNLeTLQ2KNhZXZu31q9pnKx+fBgc3qkibUvJuV9Q6TV0vBSwB6kPr
         Jhmyf/f0PcNlZuhGxM8AZ8+RkxSiEyTof1bLWH3HI/xvOGAuTPdKXxrOVmRSM152UTvP
         fBH5vxjk1oHtFV1D+axEwyAFDIRqjAgI6R8B/ko4vwoi0Ey4SlUHPcLk3keriSY3BPBd
         4+8RUQAgwjkJttJuLpXVe+s5zKHc6HoBgbFNw0RD2usoo8HbHudUXWWSRc5zJU9ifdX0
         TjwAN2gOVcXkJ+om1+ualRvPWMQoSUK7T6J6Zko7wEYySJertynraHKR0z8C9JNiI5gj
         hoVA==
X-Forwarded-Encrypted: i=1; AKwUvBzuvv0AZ5ccLmzLKjPze2J/kzFu8+aYaCy6cxSXrJtIs7RJifDVcZE4MpsDHNhkZMm0t+IlDXpHJBepNw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJVdt2HbULbiJRu2aJJLhvdqD2H7weyFW58SJTP1AHr5C/20F9A
	heuwQiHm+wHj4SfKaNCRGDgcS5KqdhgxPttxRTRTFohebq+IhTUp7lbFoihbEcrhPmrJCQ==
X-Gm-Gg: AYBFou1T/haiCIUY4Ot+nqzvJ186GqQdEb9HoIM5OJqEMjpW4m2V4f07V6bqkzFdXAJ
	Rrq3E1T/o5NA1KjWpz8ONaH2vwVfRVtJzpd1gJVWCiDKMx7f8am3EmkYzdFT/JOcaS2JLzoslsD
	RR84UwH9OKtD61iNtBDPgYWSSKNBwWIUcRBw8q12XgsACyP90HK/2WEU3wCrAmxOse09OFnmaIy
	ZOWe3ZKpn4IRkQPov9e7yVpcRTboMdbJKudb5vs9IrVdYpfsULdi1BXA1jcl39VgBpYjQQlUSrd
	O9bHhdfEI/ejr3nfqSG4FBzHDik7gNGk+8UBr6CLsysuyJKIVIRN1oV2nFjT/CDSFLJ26d5VCro
	5+0q58GobidWrxR3ySAWyeR0RQ28KweyZN+ya/mIJ7A/m5Fqwk1kqu24lZJbCQpC4yk+lSr6C9X
	ViOOH8/dGV2M9SnvhDe+yvmZpAZF1C0M3eGWPmhh6WOM4wgPqcCzb4huxyg27TgaAKBfTbf2CD4
	WfdkUTmPnx/0PoT+UuyrHZ2bwZ00vlSw/yjFqGe3k0I+SVUdsD3b9qt0xxBGqh4KWKL8prGUoRl
	P9J2QhoprG+pM5TdyzxUuT0du+nr0XLeBPgfpw0WKwykT1mSeUS2RWwQwa59nUADljB7noE9b+B
	q6bMS9A==
X-Received: by 2002:a05:622a:608:b0:536:600e:843d with SMTP id d75a77b69052e-53fcc9c448dmr20566551cf.50.1793159017822;
        Tue, 27 Oct 2026 20:43:37 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c565esm95604581cf.6.2026.10.27.20.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:37 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 1/4] media: iris: Don't flag an empty source change LAST buffer as an error
Date: Tue, 27 Oct 2026 22:43:32 -0500
Message-ID: <20261028034335.26075-2-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028034335.26075-1-ccortner@gmail.com>
References: <20261028034335.26075-1-ccortner@gmail.com>
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

The firmware ends both a drain and a source change with an empty
capture buffer. Traced on glymur, it flags the first
HFI_BUF_FW_FLAG_LAST (0x10000000) and the second
HFI_BUF_FW_FLAG_PSC_LAST (0x20000000). Only LAST is exempt from the
empty buffer check, so the client gets the source change buffer as
LAST|ERROR, and ffmpeg's h264_v4l2m2m reports a decode error.

Exempt HFI_BUF_FW_FLAG_PSC_LAST as well.

Fixes: 7adc11e6abf6 ("media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e..b4fe9066fcb8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -390,8 +390,13 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	/*
+	 * The empty buffer that ends a drain (LAST) or a source change
+	 * (PSC_LAST) is not an error, the client just ignores it.
+	 */
 	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
-	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+	    !(hfi_buffer->flags &
+	      (HFI_BUF_FW_FLAG_LAST | HFI_BUF_FW_FLAG_PSC_LAST))) {
 		buf->flags |= V4L2_BUF_FLAG_ERROR;
 	}
 
-- 
2.56.0

