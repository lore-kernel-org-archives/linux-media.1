Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921019;
	b=aafPW4pmr5s5UtZ8OfF4ueRTA7j+pBhqayogGKh2aLQ0zVmDEq8+rd0leJwyQ1wSpnyk
	 Kwph8C5jsw0zB0EIJKcJ5z3YJKu+zmfFc7UBA7WCGwx2LtXerNkPXYCGPskXGOOZMG2FE
	 NMHWStOUxru83q6B2WXszxlPb2YudE7I+pcooq5KRMetd+UItipjGcPsyaOV8ZGMyyoQ1
	 GAImP2Xl4joTxE1sj/CXfQuKQ9gCcg+572yM64+xzRE5eyoM4Pr+WGkdRKj4xJPxw+PK2
	 GGUlsYV8ugsaKRyg/U59tPjj4pT8JVaChuVnA3aFE+5Bd6ARqMRzBDrDbcer8sqFcpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
	b=S5XVAm6jVY4UkImH1b3DxTchachoiMUpOt4aBktwFJgMZrOC0/jckQJo/hg2wFvo6qpR
	 v06XIw54kcvsN1kottuaVGI2HKRKGmnNu5Jo9qrVh8iFweHVgf0RGyothfQ8SLSe+cATR
	 Uu0/npZje75jG5AOxFmjdZNXVCD8OknYriEGwAx2QfSwOcB0VahzVRZpGcpgivsrTnhMw
	 tQBr1MRykAvT/cGeOHwjG6pSgfFyR/CtYsTHiXwhnubadvfo6DRMIJtm1I2FN5DfeCmae
	 wrVgRsrGs0IQPUptqXRf8rpaf44zRVXyytwXtfRl8r5gmjV3CvoTBbySaNukgiWPleA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05BH1Ifg;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941D3606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941D3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05BH1Ifg
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e93e0d86a0so78275ad.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921018; x=1794525818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
        b=05BH1IfgAqLsez9XIudjSqdH3mRrhGMa7IGd3wnwRTamA6yvZNpV3HyDgbt3otDLWq
         UNfC+SS1j3nEXW0+UHNm3t+CJ3SZpigrD2hPsSArE50BdHyN7htfgMQRH4SjsXA9YwSQ
         cbpl2br80hp4M60gp7435pkWoBDibVW01Y+AN6ZDDL1IMLotQPpHQqPZQZdmiTA1D9V6
         fIGU+W7YfXxMabtW2QmIVN8dCKf3qJljckgHVkJgHVRFcJ5obkgYmmzky4TfN1Vmo99x
         nkZgQC+UCs7W2tTOtMM542Zoo53vnqhfcxhBxGh4xnTiQITlFCE7SaMf0mlOUGCeBQpA
         aErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921018; x=1794525818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
        b=suP0cmvGGxYhu8Br2LABjsPVwtpdERLCOdSyRbncEcx3IFxBSc07a7RPc/7XQhWWaj
         ib3LeoQ/wTSKqny5Ijy2sA879LmfT0ZjHxVNCJhmDFmujG+OH64pEoPrI7dwqZypa8bb
         /FoNbrZmxPYPE9wajkraPuSQ2t3LEce/mOHnSiClHU2gHLOzEOYLCnsCDO2gsHfr16PJ
         xGyLjAkJPFf1L1/mAhP2xGuZj7r9Wft3HdrgAWIibEXeMlI1m0Z9ldTGayHTB+8KhJc8
         vCuy0FEwGKNri8tRLFY+W/HhNxCFlO49XxU0ueafTBfGP9InsulNl3ikL/zxEWokVzIY
         gzvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwItmfrqP1DJ1E58UV56rTHODhMsrxGhozWygRBmoGgOmQ48e6XJ8JP894bxNbFkhBOnNcIwb62b7bSaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jvujm49bTQenFvuzIn0BA8XXvEB6RWEsQ5CdXd/bfTY16mhi4
	TTVqP38TOXo8qisEg6VnjmjIBnTm861WVYLuq5RzoUz73pGO0ymt3zBB
X-Gm-Gg: AYBFou2jlSPXZYmdhAOeEbO6Pb2CiX+AO5FR289AV3R/LBD4fre6fMPPILkl9O6klYo
	8Xwv3RIgDfzB58MCGbvc7KFS6SFNyGUTNZvyAuGYlzBYBcujywleyupVq5UPiWn2k0RTh8oFdOn
	/jV3jY5/2M4Mb8BShNDE655LTXRroFWwWfCCaeA8o9e0nqoHUV8DYoHILJ1qUnfCPZg+RTJDcZ4
	FjQJupLZkx9//W02i4NGJ5sF4qvk8RqMwWxv9gcHFeq2yPyiiquWMf/Ce9xNJowrI5gnz81/nka
	wU+SNO3POjN5zHXx7N5+qXhsza/8UYWikO5LptEE42B+nQ0Oc5ab6QLFqCIDf8n55xryO6/tNpx
	XtQG5QNdEKM1e/3c3Piv+WMJAnGAboIaYlrCu7cGH+8j7LYnCvAf6Y7vxzzkf3w6F8vCAjTiN18
	klpB9Vtcd9U1yWFqBnPK1i5QaHc84ZtnODtiV8jj2+afjUgy6oWec1MrVeVfkcWRNAHmR7BsTZv
	3+NWXUe40LDSqZ2m2ZWXPTzxqdPju0b+MO7S1688ubYT33E5u+ARIVEj0LR2YGJvAhwfGcRCo73
	SSHH1OZFEaVLTMyRq5rsnNycyLkfyFmPDQskNMlTUmg729tQcSHlfIHN3A20EMY=
X-Received: by 2002:a17:90b:518c:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b0db6e1fafmr885341a91.3.1793921017864;
        Thu, 05 Nov 2026 15:23:37 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:37 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by media bus code
Date: Thu,  5 Nov 2026 16:23:09 -0700
Message-ID: <20261105232310.385463-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105232310.385463-1-faizel.kb@gmail.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
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

VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
although the video devices set V4L2_CAP_IO_MC. Return only the formats
that match the requested media bus code.

Otherwise userspace can pick a pixel format that doesn't match the
media bus format, and then interprets the captured data in the wrong
format.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../media/platform/rockchip/rkcif/rkcif-stream.c  | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..f2a24832a8cf 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
 	struct rkcif_stream *stream = video_drvdata(file);
+	unsigned int i, n = 0;
 
-	if (f->index >= stream->out_fmts_num)
-		return -EINVAL;
+	for (i = 0; i < stream->out_fmts_num; i++) {
+		if (f->mbus_code &&
+		    stream->out_fmts[i].mbus_code != f->mbus_code)
+			continue;
 
-	f->pixelformat = stream->out_fmts[f->index].fourcc;
+		if (n++ == f->index) {
+			f->pixelformat = stream->out_fmts[i].fourcc;
+			return 0;
+		}
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
-- 
2.43.0

