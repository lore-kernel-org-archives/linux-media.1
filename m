Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818217;
	b=ZN/zhuFwd7BilfpWNj+w7+4eHvnmCMNB1YxN4qKmT+k5VpzeREQielqNdViwzoQId9cV
	 j3IxSO7W2FXxIhYZI7PIfW52YJqJeCOW9EqKisMQDiukaazw71xCgFQqQE+PqXgLBA6y7
	 sCAnk85kn46qbuWPY0pl9lv4lF3iuibErk11v88udFFDTKfogi3cfMkead4zMs8e3pEPD
	 uqtdzICbSPgRwocukBLbbrRuCYYM8Pg4qYvp61UjMi3M2cxRJywRq9r6IbTOpJJTVuhNS
	 wktAY9RKWtGCFd6z36sCO49FjA6Q/6RESRr+x1Z2rlALYBfuoyxlwitU7BwQsWjf1jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hgpz0Pnzy6Bfb4EoHwUzOVn72wSYeBzOC2xJFHZCiaw=;
	b=c/yVJTbi2kn/5fq7we0z7luI6KjwKmdsV1fF04rmzPB29yRJGoEvlG+orvPPPNntBhMV
	 3ZN3YkvJL6NrzNgS+QM5eVUcpPgrpgvG4I2wczT2tDWgn5+mmtIC/MDke4chldJGiIe9a
	 RMNE1onymM+Poewy+aG5rH4AkpnmApE2ezjWjCdlrANSA8O6Xr2pqatASia74aMwrWqkV
	 gRO6deYRJLfzypuAFPCaTdBTx2AVmgUzIjuiIYLLbRTV0K4f+zJnBzan+6hIBKWV99vQm
	 C/x8tA90BlyW9/xNBtuh8Ms8y+ffPSZp8TIipB4L1sBbZh+cbyBPTrFy+KoCtMBob6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YotFc647;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A7606EEA9
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 18:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1A7606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YotFc647
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36d6e342f98so1067460eec.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 10:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818215; x=1794423015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgpz0Pnzy6Bfb4EoHwUzOVn72wSYeBzOC2xJFHZCiaw=;
        b=YotFc647PWWOSnqtkGAJO+BwusgiJSDM0B4ngFBzpTRO1s6hMLg9u56bImThbZw3BJ
         w78BuBiIuPBCzbkhE7v1jBaf/RmNb06NvLwvmekA4lM3nrBmq4YhgzM0StGIUMiOpY8v
         sxvph2MFnawEm1jX28LOZpzneWAUeuYrk97Hgz8o9EGBi2bo+NeyDbLBsQpcGpJj0On2
         1jKLCZJa9nj/LpemUhv2OdrsmhGuplVd0L2wVYQTf9+fUem+YjVSLFvrPs7LE4pNpkiH
         4q/Mc3NXV0ndQJXxVo5dHePVqPaNy+DVRytdUtyY1e2k+vENVM3gyGv7j4wclkahHwYS
         fIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818215; x=1794423015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgpz0Pnzy6Bfb4EoHwUzOVn72wSYeBzOC2xJFHZCiaw=;
        b=P2G7Ts/+2N12VfMxpS+24OmMOzO//9mqQltQ55xhgaR4g2HPDCpfXij0jxam1ZVnBK
         6CZwB+0uEdXWOD8Rs2SlaPzC6jYMzqoNX0q5BYrgTx7kDtL/X2GnipDn7Y4iILmSiIKM
         y4KY51cu6Q2yvREwPAmvbR2riGPx0f8jS2mVJaeFrg4swMSS6aXm/izRtYiZq0Bn5uiu
         FV/MISNi5/GPO1lsPqfpYXQsz+OzhfQpXSg9vWWoyKtUpqoqYBU4fDwG6obLHwcKdzyN
         R2gvoJIzJA4gArHQz7vmvtop2F+OITcAWqzvuH7IBSWW8BRRjfj3QolsTorZJemEz77f
         SRNw==
X-Gm-Message-State: APuU4Z8Zc7jqXZWnw4RHYnw3UgYL4jHE4sZS1wNq+y4IY3Di16zyQblw
	BVMOrQyBduXKZNiAdf3rQCd1gtxrWPoFGi7/LwPGeWLT00F2RIFzBkKSR3gjWP1m
X-Gm-Gg: AYBFou3JUSHVDV0PqL6oJ2ZHheOOHufeEYpKR8WT8TmB3ycjYQjeSAEC0AzSB5xfQYL
	6TI+AXtU3fIbejmTbnPZkb1EyplRg7edjupumr5mTp1Y2OeZ6mMPA3Dayn6t7oeJzDfbg2WEyWs
	2mR6miirGEQz+1gu98v6YyeWoRpz72fTcB7jhV1Yr0oyz097RhlPow4U0ALyRGZsJBevjei+bN2
	pqhz957Qv01rfeJePSMlkQq+pHDNM041UkfpwHz1sJkbR2MKpQT4Ae2AM4tQGuW02PX0tzSduk3
	q1+P2kRe5tjztLSI56a1Rl6S0FHgLtq1LQOzNqw7zGTKCXyB1QynWbN7D21mguX0TBHB91qQTmC
	4+GG8X24Tv57dywfRJAKAQtxyADUD+YXq4iLMOdj5iTdHalyPoSNXib661CvJY0roPXuVGGgqta
	hvMDUke7b74dwkBVvEFOBhd7wXMnhHKUa02JhwtmUoJ8ej1hnzeaLx+D5sdDB1/Jed0eCdG5tf8
	36iNIuJHC92zTWPzJMbh5/TIVu4ny3u66HjuxD7Fmuj79+1k2gGOs5ylZLGAtNIeI3Es5SWoZi5
	9sNnW3jX8rza0YJArVgukpfnHl7TvIGexUedb2FDBJpJWDQZlrZ8udnixWM=
X-Received: by 2002:a05:7022:29b:b0:151:94a6:6f5f with SMTP id a92af1059eb24-1ac5c3699aamr23820953c88.10.1793818215406;
        Wed, 04 Nov 2026 10:50:15 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:81ac:fee7:f533:3879])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm11330186c88.22.2026.11.04.10.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:50:14 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	alx@kernel.org,
	shlomojune6@gmail.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v2] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
Date: Wed,  4 Nov 2026 10:50:08 -0800
Message-ID: <20261104185009.319191-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1],
replace the strscpy() and strlcat() calls with a single snprintf()
call to construct the IR device path.

The return values are unused. This preserves the resulting
string, including truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
Reviewed-by: Shihuang Liu <shlomojune6@gmail.com>
---

Changes in v2:
- No code changes.
- Remove the statement about buffer capacities
  from the commit message.
- Add Reviewed-by tags from Alejandro Colomar and Shihuang Liu.

 drivers/media/common/siano/smsir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 283770d583d5..636ff228108b 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
 		 "SMS IR (%s)", sms_get_board(board_id)->name);
 
-	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
-	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
+	snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
+		 "%s/ir0", coredev->devpath);
 
 	dev->device_name = coredev->ir.name;
 	dev->input_phys = coredev->ir.phys;
-- 
2.43.0
