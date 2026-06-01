Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D8283CBF
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 04:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780287303; cv=none; b=P1DXyUIVxDXkjcetn3Yry3z/zSFuxir0rsLR81SrCeR42WGVdITFb0DerY9bU8ZXY8WAd6b72bp1iHhnCoLM+i/MxS/bOCvh462jfpsKYD/Gp8X/mfnT4qqRTp6Abit+rit2HhjvvhixlXgatEkKtoAek363TaSSim/4lDAprBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780287303; c=relaxed/simple;
	bh=qP1yh5897y52gQrS74KSiUYqrl7D3oKp/uam3uTjwNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uYJYGnG29YIgKxpvFy0OdsMKbVcChKXdLrrDfAUf+CweLeMQZ003OdfNhcBicvGqp1fE8W8Lgs0Gu9nS1CKu3m68yNPrcmmC1gEjZTLOOIuDoCQ/YcE0pDqzbtF28HOB5zhxOXrBZIGUDLKUBLpHecuiGlYeBLcnEs6NpxrYLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=OBQu9TFU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="OBQu9TFU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf22d29dabso19171975ad.2
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 21:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780287301; x=1780892101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bY0Jgb/4pMElVA1zHn/XIVXj9XsaeotvHlofGf2Tv8E=;
        b=OBQu9TFUlrgkRa0pqSee9VE6S4ewBtzjEs5r9lxuWGntjsPgRyEpY+NQAyXv1HQxD2
         EnFEEZtTq19D10YeRd1SbJ6H7z1eR0vOXKEjDaq1HHrsZzO5hwgTlPm9zu11KwhO4Y58
         yQr5v/WflKgcWzALA0GOvAJxIMEzlAfF97W9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780287301; x=1780892101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bY0Jgb/4pMElVA1zHn/XIVXj9XsaeotvHlofGf2Tv8E=;
        b=R9k92aKTSluSbuC6+yPX+NHff4qlVv3iUC3WYL4n9Vcv21lsw7vANNsig85rJgSAcA
         1NT/bxP3ECvBxMVId0dSWPe/Qa59++/33EOI5zG7jZxDl7ontsavvGhthC7SliI6ck4q
         WUHt7LvUowNELGrJYQcr1KPlON6/A9S0xT/5rv+fLh/1V9eYZnVhEdIaE7tb7QvUWz98
         5/EgtqI9RydDM7O6AQsYr7LYCUF8R1cu/4aIaaT9QOCXAxbWrK3zvlnl7isnPm7jtGpW
         PQcmtO+pwBawcSsaWXUqnBrqLYfS/sGa6g6S4MHrk9BQmsNDdadDpitLxZdeM2VG+xA1
         vYxw==
X-Forwarded-Encrypted: i=1; AFNElJ/vHK8VLNa+pH1CjgvE1zntb3Xx9iG15UDGxVxt6O+pZHvxZwFNUCFwyt4yzBPNPITXRmILQRKjeYUTow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8z8A5RPdHYe8c3oSiZ8h+huRuIJuKDGKKW28XmMJBdy5IqvqR
	OUTpxAWqLBYpse8N+N5ECueyzRFKRkym8bLrb/qFV4lDxPT4u6+wTbMDVF1jpvTdUv4=
X-Gm-Gg: Acq92OGL0DxPM95f+AneHkiSx6ZEZr49XWFrVuRcfVDvefY/JwRv2HdJ/jbZIu8fP4u
	scpw9V9aTP9HuJLBOXN33U7Dk2EVVvSsZCOyXzxnqXOmkhLIyRZtiXE/kyiCFe4bg6uCqOWZSwI
	UbVT1AMXZ0fKhhLwUEVlapYqZ+/rAEn59zQmsiYZ22Y/H7hkGti2wsnGNiExSi42F8MTs7ot313
	GZI445LoaQyWtdJ1wri894aGa9Dia7P0DC0wt+3dvP4jK8TculstLfiqvF7DITgV3lH7mtzAuUn
	xi2eFV0wmqXMRlv43d8tX+huBdBWNsfiSe97fNWVTWRBJ2NZv/RQ9aermTv3m5yXWAtAI07KgoL
	i7DIa7PnW05Sj3Uab+bD3ZB3sKSZSdZ9086tr+7RJ05K2fIlxDj2aVcVqbHrCqN57FX6CtaZPa4
	fIPTMwJRQb5BqMV4Ivo2gchiD5MFT7VWhVYEQqxOvKFQZYN7DQPU9Z+zXVqZDNfAlG064uGC4Zq
	SD5sZQb8LS1oOc+YRIr03VJXXlBDgGx8zKGZTAkS43N8O4QpWbjNzHaTX2OSm88IzQntue0SbbZ
	D7mjrsznhDhjX0DvlBheJprBh/DAUq/yxQKtTHRsMtpfXbdCTlSVDo1SbtXpFc7W717MyS+ujO0
	OuDQ=
X-Received: by 2002:a17:903:1207:b0:2be:bb7f:ae2f with SMTP id d9443c01a7336-2bf36846815mr104349185ad.27.1780287301511;
        Sun, 31 May 2026 21:15:01 -0700 (PDT)
Received: from aegis ([175.176.67.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm92980405ad.76.2026.05.31.21.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:15:01 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
Date: Mon,  1 Jun 2026 12:13:34 +0800
Message-ID: <20260601041336.9497-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601041336.9497-1-daniel@quora.org>
References: <20260601041336.9497-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with web pages that drive
multiple concurrent video decode streams, eg ui.com.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000)
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

This applies to all current hamoa.dtsi consumers (X1E80100/X1P42100/
X1P64100 boards); other Iris-bearing SoCs (sm8550/sm8650/sa8775p/
qcs8300) do not include hamoa.dtsi thus not affected.

Backports also require the preceding binding patch ("dt-bindings:
media: qcom,sm8550-iris: Allow IOVA reservation memory-region");
without it, dtbs_check rejects the second memory-region entry.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..e2af0bc5e064 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -724,6 +724,15 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		/*
+		 * Iris DMA below IOVA 0x25800000 triggers unhandled SMMU
+		 * faults on hamoa platforms; reserve the range so the IOMMU
+		 * layer keeps allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};

 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5479,7 +5488,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";

-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;

 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
--
2.53.0

