Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605999;
	b=CZldmzrrkkv7XBRjI5pvrWcqwu2q0NRSf4FpPKcZYU82cBAxY9EeCGCw2iRpFo5uKsj7
	 o5lJFYjdWGkVyQbfruGmJX+qyweLzZcpgH7Io6dzwtWmAog82fCTjdtQ3i9ndwASGIY0/
	 16CgX2VjghjJtsoDUPxmy2g1J7WvaWoQ2kbfIwj568GKW+sqZjeGL3SfZDsPgUcGLGRkb
	 WiTozcPWp8dVBsqs+9BLNzd1bTmSUf7DK3d1sj9a3KMDjsGcgP5CU+41uHv4h2NIHBLoj
	 fZTC1MM7TcnAd0xen3gjclBXoH9ktQoBl38GGFOyN+Pnil+7kg8531Ak8NKKVN5luRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=uYAdKatm7TqvwIhXaTr9QIeB5AzMLXX6d3nE4l7L4qP3PNe4cXZB2MC1wdZbnQD+CGAI
	 9cTq3eLRwHXu0jTiUjcNTm3xTf2u8oLX+Ubfatjn7s2Uqf/77MRWZy6EWqpFflyA8A8fn
	 6Moj7NvznXhmJXPArGqP0ugCEDiuYgnLQZ2xONSyIhZxkcm4+qfGNrUSI5l41kGz6KtFg
	 jDG/otuGnVKuV47OGqEIvDDGKoYRMCb2JnpmZn1t4z2ccemHP8UqyQKI30QYCv5DIMGEk
	 gYes8snxxWARy7nDBNsm37q7ZfLfyKmK1rG3QWi31DvajmwXJSUSRLRS7CVbz6/O4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F51C60A3828
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F51C60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso7703207a12.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605997; x=1796210797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=RVGQ8Hgq8nSm+KEOOWBIlYqI+TMl8HVguwqgFXbJguqc0lDwsjLI1kgYrBgUym83sx
         Q+sNBxZzC8ENFnb720pQzCWyGyxn+F1uzf7mKSCZjksGaetzcmbIk2S5bODx01feZ7HA
         5ChvPBgvjQKG4KB4m/LKfTYEFdGg2F+dq9vlr38mJ1ILKgdJ3gc9j753NII4BxpJ/74h
         usfYMs3nixas1jpCb2MvtF+unJNTPEaxxu0lyJr/5jiw4tKpQjbWArt+Nhg5J1Q+heiR
         cbU+T/8vdMOaSh3i850GylT1WTOcm73gCFEqukg7wXkHAZ0c4D9kNucePNH+MDu0cugl
         3cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605997; x=1796210797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=f/YlKErLKcuYuMCf8f9sARqruZd+xuUagn54ahJA/uIKCRjWOVuzMnAyQWth1yd7dx
         DS9mCwq+TlFhsGYqwIM8yXTi1hsRpzP3O4ZNPK1oUg19eUR/1Q5R8EAuwoOufpSxzm9+
         FG6RgRC3Qw7+5h6CCnbjuQWSOR3TvRI9E6vDfFq1NDROnTvGwgaL63+6Obd3VBhf942O
         ndDifxczij+wdDsad/DQv0wZgmJP2tlUk54THVnLvIezQqYmbI2llu+zNbaNxjsaRgO/
         v8XfxDbfrsPHKt+Rhl1U4SznwfRFBk1li0gqdZHiA49AxvoSp7UTBdD+qXah1hUtDWWQ
         STcw==
X-Gm-Message-State: APuU4Z+WhkDIEV4dowGzmTw0bq/NLNTDYvR8w28SBOQO8JKq2AbWE+kR
	Ty+y48NrnrGeHoRdxnQ/derWLt2BvYdm0lb2szZeTuhxoQSgKB3fSt81
X-Gm-Gg: AZFdTZcIVL/PccQjkE1MEltIMR/O5Y2ggDjTo3FHIB0sAJTOZI4otPbwEzh/TD5xTkd
	OUQ6Y4hxmuWAJIJFO6g48to78GlX9cOholb0lx5Tr7TLES/6ykHjyEvyWCJuroKcxBvKKPVkGbx
	ZDkSjzMrkCn/2iaYE2Us7noGJqFet2b60JJmmS2MOp6iYTd/f5HJ5FT4YhZKZ33Qo/Ju+0aONpT
	vMEdpFYwA4m2AwTVh/UOJoek3WZKCBU869uV73iwmFmJCrFEHwOibCXAI6Xp9eouvXk2VXfFmkL
	gwUQOQQPYL7LCmpvGPHnyQr6P425kbwPLms0P/stEea8lbnaA7rAs+k1P8iIKa4TXuWLeBZ6npL
	QDYrlS/JUFgJ1LGdypgNINeAhA3CslooiA4AstL/nolbC5hKhKCSHJoc/oyrXWwQ5iUexC4FXeD
	sLu+QgEXUOdK7vkkNDwXsZv78i/vNeqa8U6KtWZ0Axl8LQeVFUN1MHtqfW4ugSTDQamptgyjOCt
	NTnycylXLayhj4UAJZzlhXgkq2AKKGGDBv/3haiKP0k0rretboNmxQ5bw6pV0e187tIKjn6jorM
	DrHtacyT7TOimAoUQ7mW1yKb2gHeWrdoWqs4pExZOd1qzikWlvvaSZdgYARkgkZ85/ZHy5JwrkG
	RGyGhR14oFH8Cx+xNfuXfHZ9+170ZX7U=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:dda4:f72c with SMTP id 4fb4d7f45d1cf-6ba729046bamr8500699a12.44.1795605997391;
        Wed, 25 Nov 2026 03:26:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 6/7] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Wed, 25 Nov 2026 13:26:12 +0200
Message-ID: <20261125112613.237333-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

