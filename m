Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44074D0A13
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360004; cv=none; b=i6NRNyZ4ujaQrt1aXEDCK89MZ2hOUBtODkVY36BwIzeXvcDSAK40HVqlQ+Ge4uQe/BgIB7A6QNwemgmvxo2mqSPDZyy9wVm07etzod9VRTwqMBhJxBQ1WTng7o70A/S2227L+ayODlv0rHYCBEFOudz/pustmk2bSa5E+3LH+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360004; c=relaxed/simple;
	bh=HGpVmBgrp87uDedZ6+NueznYEIsUv4O6Rx65ZiU3LUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJ0F0aVkSH8UY7MGqpHS21vcoA6v55ss9p71luu0wS5uggfbm6jH+7zSxJQo+5OY0J4DR61ENLvyS59Y1/B357+mY4slBayjeqJ2W+4tWA0/cQI1BNZcbz+2SWErVLrha8TxWwfGhzjiiYt1oB+Hby4WqWB1XsuEF/Z6kwDdNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=ydgFKZ6X; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="ydgFKZ6X"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb7692a57so15701781cf.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790360002; x=1790964802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGpVmBgrp87uDedZ6+NueznYEIsUv4O6Rx65ZiU3LUM=;
        b=ydgFKZ6XmV0kJGBfqXiNtc23KBPLUko5oyjqotq3Vh/v7MHXpuWuCAa222xXdWcVeo
         cRsrMcXnXqxB3jvkbJpOq/FNt6XMwjI5CuPl96669hRc6ItGjH2QujO9URE7ckVbDEiA
         Ez3A/FvUrGEZNzDGL43B43ZELtR2UlsBGOw0edUeBaLDTF7xO5YwAi1/8nfluf2huvg7
         hc9xtDWb1zwKTRP62vRC1ozrZntQCaD5UBaJr0bBIg80bx4FibOXZy0BXPY34ZmWY7Xq
         bPL3VpZLgv52XRr1sQRNBSdVmrcNNIZQdw/bLjElv6TKwz8M2WR1ur7dcf2gkJeTJSwx
         tWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360002; x=1790964802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGpVmBgrp87uDedZ6+NueznYEIsUv4O6Rx65ZiU3LUM=;
        b=VbpQvow8ffcrsX1AkPAFstrHRFmxhgL3JvjzIHx7RADWf2bXKb5aBH/O7I7jfzrW4+
         JQYNaTnAn5KBCmGyOTrmremZHq0pmK6N2jGhJR5o4WsN0/bm+3DnYzvit4NKugH77r4H
         d4BzUixvYJ5gTh1Hh7S3Ie/5x3EXrjko/BuxVPVZzZSWcEdYBudYlWoOkNesBH4q57Ar
         OdrEKtG2uck/wAkAIDmtLmhTbORqGLuiC89V2wjVgX4j6plRglvp68UZEVrG8OX7FMXI
         f9lvC1MPItc/nAiUBQKcJX5wErBbeNI/56GVGKuOn9L+HGule5YLkYeV1n7iOj8M2r9B
         6evg==
X-Forwarded-Encrypted: i=1; AKwUvBzHwxQtVr+i+TvRyxkK0HrknuoBf6Mmo1xzbwrg43Ht0fr1EuU/684Y+7a77n/hKz4Ty1FY4cNkFoeTXw==@vger.kernel.org
X-Gm-Message-State: AFuF++lQSvhkIz/SF7cFOb51OiZnCN3PaC/8ECCsE480bNpvhDYqMnyr
	cr7Z2qwoxZjI4lQmzAohuE6+7Y4HTbFM/V0RYL+uRhVmWEiKKZEgKcaWIsccbQWrrv8=
X-Gm-Gg: AYBFou3ibRWb6rbuEzIDLN9O4EDxZPIaVAwF9UkLlknrsSgnxLuito10J2X0WhjaFXa
	Hpx1a5+W6mBpBoKqOvCO6mUsTPeAZyI+DQ8tXcAiYpyWw48EIe6lWcLXotUaEtfgHAdv2UIrXvj
	tiRqLqSBGasdwpN0RzddXseIlBwbCQc5UDixpxZ/7fC2NB+f7EjLVi9zAwbGsjKT9LCiwt5Wtjw
	0JNN0htn2Xz9H8pyot6f6rxKfOv9ATq6Qyy4LQSFye57i+zsqxBJoNf3kaEc/b8tCAAlQLvLncn
	xChWYnZZgmLUpj7myCi63iehTWgp5vJffZ4pcdkOa33fFnXwjQQGkZ/T1Zxpss1wggCWdGFinlG
	ZbAXhvh+TmG2AB0PoCexcqOrStsG06fAciyAWqorngeh23vV7xM+IDauioO2Fr8DM73guqlCTA8
	QDPZKlKrpBni+jjjhDhkolsgzTKMszy5lsxYg0fOK9QTWvdKE=
X-Received: by 2002:a05:622a:58a:b0:532:9d80:3fe9 with SMTP id d75a77b69052e-5330b6dadfcmr62777901cf.56.1790360001529;
        Fri, 25 Sep 2026 11:13:21 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330c0452d2sm20046541cf.20.2026.09.25.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:13:21 -0700 (PDT)
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
Subject: Re: [PATCH v7 03/12] arm64: dts: qcom: x1e80100: Add CCI definitions
Date: Fri, 25 Sep 2026 14:13:17 -0400
Message-ID: <20260925181317.22532-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 14:20:28 +0100, Bryan O'Donoghue wrote:
> aon_cci_i2c_sda3 = gpio235
> aon_cci_i2c_scl3 = gpio236

Tested on a Dell XPS 13 9345, with the board DT for it [1] putting its
OV02C10 at 0x36 on cci1_i2c1, on these pins: the sensor probes, its
chip ID read over CCI, and it streams.

[1] https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
