Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5F31A55E
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257563; cv=none; b=QNMGfzbGXqa2qO639hidpVSqtaQ9kj/iQdne+CezojPYQ6voqX6WcNEVyF1BRJf+GPxrLrp57YPPJQkWQKprzppenXoN3lQXNFXmTXkgmxXmcvpuqEnPBGq+OuYSU5tDQs1D1p1qrioxyFb0kpEPsiZLJpA6wkUgAJ8hWtSnnCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257563; c=relaxed/simple;
	bh=IVQpi5kOsSjc6nbKgnNr4wTB7eZdYdNqamQ1aOhbGM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuzT1g4lJzEF3HpAGQi+aoBD/9f9b6cjpzlraT1Ypk5UwTyYE1oeZ83rt2tgYHKFUFpn7MGfhey+DrExeyXOx/oB/dAykP3OwP6col87pOJaPNw32/tnfEIs+qyQjQrG4kDMV/CPUQNVybEcrAnNRzJ4t1Rw8B9QR3sV18xGpH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO6Z23b1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO6Z23b1"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso3978827a91.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 20:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784257561; x=1784862361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZVR56XOREeMXVCUwfvytwmladieL4xpwdBWK5Npchw=;
        b=kO6Z23b1eVbRdc74ucI94vhxYTXsLZAtfig0piFQT2GChZ65Q2SRB7z3wOvDdh7LQ+
         PsbRvSc+hV/Rn5u4Qr903g7svgPqMneKMaf3b4ljPOzWWEqAwBdudiVYth2DKkQqiDXM
         bvUD0sZXL038DLgPKYwVae6jDEQ63daN4GLe6arnIXyW8z94r8DzXxdTe8L3QZ8CqeKV
         E3yXG/je7a2F45HRkzsbaU35StnVS0BJJg6Cafng8qyKGT9TRmS5SDnDRPQyf0YMt3WQ
         VDb4Tfat/ZBH9jrttk4m7uTTDDTzmXO5trBEc31bMq6E4Te/8buqBF0v8l24YdLhzrw1
         WPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784257561; x=1784862361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZVR56XOREeMXVCUwfvytwmladieL4xpwdBWK5Npchw=;
        b=NLwQU8MYFR7TfjdcaPC+X12S9gR8TxW/E3Dpao/hW/hCGjbgaA0WRccjN3qS5XLhCo
         WtAqjGEYD/Nr5BuUWG2dr4hmFCb1rdoAtiR1oCLTHIr7Fo8QTsZNmI1CcsPke2GFk869
         ZTmt/YIqMq6oPexOxBmR8pgZqlNemJ867oPZBG0kE9yIACqi9qBefxp1ZDz/rzSFjtt/
         RQc+oKNwP+mqxIIZ1YNiUZDKt1XRKcVdSEtCIFMz42EZhATNUulidnAdIz2Uk2McYzWU
         GoissZQFut784nd5NlRQbuojmUji4yFHLOme/mAtBWfybWlqGqYEr6V7BwaH8RkwC1qC
         8VvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf8TPfvjFlPaWHAIIGxfcnlKaWfzFzgv0Ysju4wtHVMFePS57NVIpjOjJAXpZK7VgrpzLdyjdnBDNx/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YweNarB7xZzhI0KZxhybtYdZBO4Ql3Hh02x8cVyc9myQyks4gGT
	mYqod8/aoe7A1oXTrs9MyPFb1VGZKegml/haiGn/MvTbil/4TXOY91j6
X-Gm-Gg: AfdE7ckKRS2Iixv8Gb1PhiUEOp9wfMGM4RNY3YrarpzT0j6oC5NHjJDFA+GaPWLy+jx
	qDjsKnyhXyXnvhnUXWI/rho6nUTcidtc/lmckyJYKpNc5e+sP4pZk0G5sx6YdEm3/uStm9KBXcK
	nlPt749FUkP9mvQJ5uabcxBTGwY0hBM9V0MTbDiLKtbyLlHOeZNmMQnSPSuLcY0GOP4xTn1DuZN
	e9Pn8ddaEVKSyhM3T/TsRCLnBpZWn0rxwSKYSVK0HmbxBYHC2sygfwo/yrqaCWBfTxwUMcJIZvf
	mI83lhXX+F2B+iLNuftFsW5uuYf3mbDDONqKqiEpV24q2Bnhe47k5607/Tzeodblld5sCNHiirp
	jswOEX6DYsP/3krrg9wUix711NVbU+inVXEI5cP5bpBx77kS2jl46LMfbzxNDFQKmA6UE/fSWBc
	eR+FZLXkcl9zHgbMuqPZzoMQrEu0QejJwZbuco2ZpMV03G79uUOi6GTQnme+LuLMgycwhyRUOrf
	Sls2jKuW977HXOMRk9IBb7avLm8LKXTwEM5
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr715137a91.18.1784257561268;
        Thu, 16 Jul 2026 20:06:01 -0700 (PDT)
Received: from OMEN ([103.184.238.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm1424650eec.7.2026.07.16.20.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:06:00 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org,
	error27@gmail.com,
	alfievarghese22@gmail.com
Subject: [PATCH v3] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Fri, 17 Jul 2026 08:35:58 +0530
Message-ID: <20260717030559.167-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
This masks the actual error code returned by the clock framework, such
as -ENOENT when a clock is not registered or -ENOMEM on allocation
failure.

Return PTR_ERR() instead to propagate the real error to the caller.

Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..fba1e7f88d81 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pdev)
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
-			return -EPROBE_DEFER;
+			return PTR_ERR(core->vdec_hevcf_clk);
 	}
 
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_parser_clk);
 
 	core->dos_clk = devm_clk_get(dev, "dos");
 	if (IS_ERR(core->dos_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_clk);
 
 	core->vdec_1_clk = devm_clk_get(dev, "vdec_1");
 	if (IS_ERR(core->vdec_1_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_1_clk);
 
 	core->vdec_hevc_clk = devm_clk_get(dev, "vdec_hevc");
 	if (IS_ERR(core->vdec_hevc_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_hevc_clk);
 
 	irq = platform_get_irq_byname(pdev, "vdec");
 	if (irq < 0)
-- 
2.54.0.windows.1

