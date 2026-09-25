Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D633F0A8C
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360017; cv=none; b=CDidyGoMfRg1nsGdPKLiFq7lTBm9KCGhQhYlniNmPHFX6O1t2reGBo+J8XtEnRlrq/rJ9u4v+zLM0O9MohZNG5HeFEoPsHgu/xb9VxejUfcTxNUY5rW3Jbnj959dIK19WdlKL5YvYd21QpCFlf3ZWQFU3UjB4DRUBM/kAZGytY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360017; c=relaxed/simple;
	bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRJYeO1+3WPb8XQuiEokgnpltvUw7LtCDXuAp8hU4ML9J020M/Q6BP0KCLqjOBpperszymuYt34pHWvq/cBEmgtTjRBpKoTSKvgKO67RCcq62ttNoEQJ0uNLTiXCB1SokyRZxVkYstb8M3VQnr/Phb+4xtA3hCrRAEmUI0dfIG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=jUgYvHah; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="jUgYvHah"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9107051ba26so8315016d6.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790360013; x=1790964813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=jUgYvHahIGtLjFSWGaODdXohLdw7g544iNlxxuLC/HWV+0AnhtplD9xON60klLVHd8
         RUkKXcp/ZBrIBNSRa05aqMfkzhPT/RovLtKRy1t+kvNQOigG+Wboq/hQliV0heKb+nzg
         KhsoHsapwVE6llOKCG4xvtqe46dohfMbTprU9893lBhABvBphuHZtyfAwd6P+v81Q/5W
         xpseYIcf51sEmOy4o2x470L6AhB0aVMU8KD5hnzawpeYRPgjjS9iPNlTqtXqMpwbhyFF
         0YgH7XY0dp+NP4Uf+5DRPOy5udy0toPbzbpwTKmCMejvBqzffHpkgEpphfeByrIvHzNM
         ZAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360013; x=1790964813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7cyx8ZFMDDwydxGqFeynq7iB3D+yw4T82PlEIczfTQ=;
        b=NchDXzgHIVFz7Q0m356nWfvG7TeFm7Mr5HKwgrQkfSAUpGxjzeDt8yS2oWC/g8ns6I
         wUduJRCPRVWnDdAApyO9fj/yIqyhQJ062SDMZgO+4Bel/BC64x/vM8eVD7m9zeLzOfPX
         YaY0vmduoRqYNPNSVBaH5JYapJmJ8b5wRCWTJn0DL/aEKmdTGrENZyK3bjRk6BUE/Y5W
         5+NXPp9sdhQ6+/y2OfUtT4dJurdLjeEGS49tr3s7A/W1VyIIUlJWZsXS2ZiiGjsotPu7
         jUD0O1WKwMet/+mN3hGzHNWFtghQQcdyfbeu932Zm6iIh0DUx11UYg+pQxnLataVJWzb
         GVbw==
X-Forwarded-Encrypted: i=1; AKwUvBxVfoj/98aEo4jNvQ3In/m2LDDID92WFhdRqnaBSJUP9wTE+o+9gvIA8zAZ++bOvoVkL0vGiuacKRD+hQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nbYCNbc/e/UpqPcM+7IMFBgIc+IA4SVcDjN431IzyqM5UubXdr
	d+vhyaHjU47XfU503gQuZLrc51RxhwyrD1LTIlH8rjEDW3niZlXqVDSlsn+HIckXobo=
X-Gm-Gg: AYBFou2ybGLZYwr20S+0Ahw2QveUiNdTRF8ljROOiJ9rCQveuSq6PrveXxWQp4Hci8k
	0+qwGFiJ2OkP7BO4fCulZr49dBpFBvBmbnMqegzsQnteap/XCWzrDv6s8WKltY2zOZ5evEX4m2r
	S2le4BFF1gr0qxfENwGKjJOB2auqGZnOOpoGMOpAr3qkllVji41TF9fRGj5NklDzU5jaCo33crr
	+rMbzrJ3tt2NHnrCii2M2jzUZenRIPUyeDZi6sLVU4cNos6r8oRwx9ftGmubNEYhgNSkut/rz91
	dmchzkO6fBI8hsTHqa06xXa+uG7G3KBs8UP4ZzFQMdPKwT2EhWEBm1DukFrsuaYK9a6vCbbVke4
	+Tllg6QR8HbJT9znN5mIxXLNTWEGCRYUMb+gWWRx0D0XJclu8aHDERykWMfmpQBWG657gy0wy45
	iwdGYDpaJqOti9ql3MFk873pnbsmu4DlCAfyPtrHvtHLUar9k=
X-Received: by 2002:a05:6214:212c:b0:914:433a:59ac with SMTP id 6a1803df08f44-914433a5edcmr9586606d6.38.1790360013409;
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dacc41sm22471816d6.14.2026.09.25.11.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:13:33 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Fri, 25 Sep 2026 14:13:30 -0400
Message-ID: <20260925181330.22794-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 14:20:29 +0100, Bryan O'Donoghue wrote:
> Add dtsi to describe the x1e80100 CAMSS block

Tested on a Dell XPS 13 9345, with the board DT for it [1] on CSIPHY4,
two lanes, and the PHY API series v20 and CSI2 PHY driver v18, on
7.2.6: the OV02C10 streams at 30 fps through libcamera's software ISP
and into a browser.

[1] https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
