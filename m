Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201678;
	b=phr7y0yMNyTHiwYp+DJcbj1b5TRXa/BvtI2s6CUQXsJASaBz7Z16+btb5vggRmu8FenV
	 GONCFXzCPhvaPblyFjbk1RFVXhEViEzL2iehh8dQ8NPKExdjT6BREwP5++v6XeZOpP60t
	 l2A6GRmhfbie6kxyKuRK2/tv61s8hh4nJhsybSsVJMr6PNuPnq5K0j1EJtbxD1iEw0HCp
	 3JkQOsOeEWM0MTTAg/jlWyNXbBnUHT3kdhltFM5gMleHR6Y8lrcwGfpSbXpkXoxY5Ob9p
	 JlGRk9ELqd/ZNJe4bBxw70xHxcwRrWqFGjxoqqBfi85jafnQM2DpCfLKskYvSHB1IDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
	b=MemaivKYhya4AnUYLHRPINzdP86Ol3yRWZarVhSp+V8V5Ls9UVnWBnC+VwXakw+zNAXO
	 1whN/wBUggJp+25lQ5Cgj/UJg/KJ7mu+mGIEyj9ILLIgcMV6mq8S90MSAwEN9R9GlK9nK
	 bPpl16GDOj/E91EYex+Atg6IIsd8DlF2JeGcAgA92BztWl5vDYdCeha8WALsN1JGqSzml
	 qTQCpNCtDzShnb6aSNAYx8DSHQBwvLROTR9FMxjP6uXC81K5A+fWEQWqR/2WlF4wJH1m5
	 hhH1aIjWNrDwdNNOY9DHtJdLjrradopnU77bswPEagxU+DBMc3ppc9izvuy9Fnf41Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQMZ4hD4;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE286606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE286606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQMZ4hD4
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4aa3a2a5a15so372195e9.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201676; x=1793806476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
        b=CQMZ4hD4sVB4t0bzFakBLUKjDTrGYS3mdtMI0Mk9SqITBCUJ/Q5kUsVwo/cjdYl4r2
         Gj0jSmbHV0IcRDbeLEBRdiwmYy/TNMa2GgVWaNLuOEQu7p/KcrRi+NDnoxlrCtoGmnCf
         iB7fUXehopDG3JisGR1WTJio6CfokUl6bMkicidOn2udHddVNf/YNyxFbsOgoEhgCG3l
         SKFemmXOBmpAZzo/oXCybTSVoMI3mlXcweJM8J6iZZ3F1gg69y+WRkI3JkMB2k5uslJo
         Q6cCnuME7SfxFb98pVAlp80QGk9J/k7wKCW3HE3uPvCRav3rOG0jEQuGee/+B6/Vshjy
         szdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201676; x=1793806476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
        b=M7CuKn+WZ2/1UAY8rjqrysMohOYFYbQFbGrervoOlUNBn/fz2pIx4s+03QQLQKCOu6
         Un/syQPt+VCFW0xSq+FVDcS0GMH730MeCHIm3UV8KcxIJ5RwpJ/x55EMBjm6eNfZwy/A
         sxclNd1OK8fGYlSTjg/nXH3B0c5eFEGDhfGzzxA0t+fzJZRp68lW7z4CKgpqLe2VHjfi
         S34rScaIvzbU/swZ07ptNYMaOXFMLBTU3HtqtdjW6beBECW2QTZMg7DUrgsGcA+H+96f
         lY/QEQ2tcR0sIV1hTJ1eKwPsrA15XCns9iCqEZboVooXRzJYDUbJsribtOIMlCRIxGBE
         dDbg==
X-Forwarded-Encrypted: i=1; AKwUvBzvZoRrEtiQWmCZ0km6/fBZRImwIFweJFlfP0ajQ81p1j7jArbidoTa6skvvrpei9zD0KfnLoaeWuh3mA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4yPfFTS2RQT2/RN6W16VTwOjxqI1wutuAyWMFHy5DiF27Wb9I
	LqQgsl1qiMmI/8j+uSgcR5f6UD369diMvXNlG1ctbD2od8wdjbA8ni8R
X-Gm-Gg: AYBFou2bGnuZiVxM1t/87AMP9Gti2xWLiqss3v6uELzAuWPf+lYW6ZCeu0mBvkeVYIS
	5dqTPF85BHcBG7mU1G6AZPqcN2FpieHb98BfM0kCK7Zt8dDh1WLCffBPwmd2RLJ5QqRU2WCOty7
	4Jtcj0AEGHM6/wB449f6F1epGLXyyJiUT15O39PBhQfosUplcMQepvxuw8lVOcitWw49uZdmam8
	O393RB2+BzuR5i9qsbqNa48m7//qqEybtwKg/R6hAzMepFdT77XIweK+gBB8dG2DgcMG3aif18l
	MAc7t3cttoM/zHSjeAfZsk03Q6jOehNjx5oz9pZKLV3YmNKWA2AaDAKnN8tHF2GarsRCc8NP6Bo
	q1b+KJqwvAxtsCjlvCoHgwcxv2dvcWiOEsxfdy9UUdSmkRsEsld02ifwakJMm0FtNKMxxfQZ+h2
	m8UGVFrkjZSFPpJcSnEG06VldFjaxgFXrkjSPke3GUYRQY16oXRjMLEIFtXkCdYNjoCwYsSAaUj
	uB9NH6dtnyOeSxCGf54+Cw7cj5JSFvxV1wp8hildkwE7jeBB82FIrTEs9+0xrLEr7kTIolNBfZF
	GQ3CerWOt9ZoX6yxk3VCgFFedorJnKLzFC59FqLmqKu1fkVagRo+ZyDGqKHlBNm8eDLVfNDhqpS
	DpBBhzHRZXnTHS+agTDPKERQ=
X-Received: by 2002:a05:6000:2ad4:b0:48e:60aa:793e with SMTP id ffacd0b85a97d-48e60aa7a9emr3918828f8f.3.1793201675959;
        Wed, 28 Oct 2026 08:34:35 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm14428423f8f.13.2026.10.28.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:34:35 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Akash Asthana <akashast@codeaurora.org>,
	Roja Rani Yarubandi <rojay@codeaurora.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org (open list:QUALCOMM I2C QCOM GENI DRIVER),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM I2C QCOM GENI DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH] i2c: qcom-geni: fix double free of the DMA bounce buffer
Date: Wed, 28 Oct 2026 16:33:52 +0100
Message-ID: <20261028153353.69651-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

geni_i2c_{rx,tx}_msg_cleanup() release gi2c->dma_buf through
i2c_put_dma_safe_msg_buf(), which kfree()s the bounce buffer when the
message buffer is not DMA safe, but leave the pointer set. gi2c->dma_buf
is only updated when the DMA setup in geni_i2c_{rx,tx}_one_msg()
succeeds. If the setup fails for a later message, the function clears
only its local copy, so the cleanup helper sees the stale pointer from
the previous transfer, unmaps it again and frees it a second time.

Clear gi2c->dma_buf once it has been released.

This bug was found statically and compile-tested only.

Fixes: 357ee8841d0b ("i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a431e98723ef..78701310936b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -500,6 +500,7 @@ static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
 			geni_i2c_rx_fsm_rst(gi2c);
 		geni_se_rx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+		gi2c->dma_buf = NULL;
 	}
 }
 
@@ -512,6 +513,7 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 			geni_i2c_tx_fsm_rst(gi2c);
 		geni_se_tx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+		gi2c->dma_buf = NULL;
 	}
 }
 
-- 
2.53.0

