Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445744;
	b=Ya4CCuRVx3SUF0UfmLHgOJV1DOEmowYCUNLEHayRK8c06lLyrdMu544Vm8fEwN0BF5tU
	 7GjlTENt3PqoFDaXGcTisnYbdWzMiYnri+u0Wu2+6ki8YAKFi5aQfMS/cLGTZwKqvB6CU
	 +f8W5Hs35g4tGCWJhbiF2+qGcXgSHnBMvM60lQGnI2puGukMigDC790gTltfRu5YuwMkQ
	 QUI4B88gZ/Cj87YcH1MY0Jai2z1qaXSlBpH2yqllQHTMnB15gJgLDDI1rM0B5h3YwoJa9
	 LqFdAC+JSnyYtGSZQAG07RZjLh6r6f2COIJrtHnoO74m3lkMtN6Fn5V6Yk5UOCjIfCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
	b=Iy/Wvy6UNFYU7LrMa6fE7HY/D7ln1C75IbFMB6spC+ap9LgwLGzgaqsIbP282ULtFxL/
	 P6JAYFgQNRtpw74Qp/nUtkq2LOo8sfWW4xJHIji6bOFRPc4NPDxe5kqk95N7QXI6x1JLp
	 gpNHUTdxPWW4SbR7zrOdH9t7NfirxA8QudwNbMruHGNRCujXgJZxguGafzytxLe1LrTYx
	 Nz7TUI7Qe1lDxVgVEeBi1GLI4yxIaeJgNMO2X1p3Bo3S2/byvtbtZ5bFJNjMFQFmRioRx
	 VdXAeAxzwSDs7YX/+LBb8WBnLcg59/KN7XxutPtTmrhk5eBrLPLP05nqdlQNoIZQcBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uIFEbeX9;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70A606A31D
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB70A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uIFEbeX9
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2744331fa.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445742; x=1794050542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
        b=uIFEbeX9KYrdDJbFM6EJhXmfhbfOk867XjudZFcF/TcyOPe0Qn7h/XCsLfXT+svrik
         V+dty+BAvcNKWDygTdJ3ruXIq9FfDAC2v+ZHefLofDvTyjE2Ow+RUYNQlzAcLEvTV9oJ
         QCTTso3sK2UOGHrPPhxP3JEcpiBiO0IpDkJAzD0d+8JsJ4hkcKhO7WPmMZ9nbH+bGvTw
         Z7ONptNZpKgcP00Bhl4Iul2v+3POyO67xGYptvO7qTWtB6WJPt5fBXhWUhSfBb0ty+BZ
         8+Jp995w22U6HQEs/AA6uxvGx96hNq6W4VIQu4y3UPKi/1XcU73KR8QoEcmKezhc7Mhi
         bxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445742; x=1794050542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4IDuCl499mXr6HzO6D3TIak1ntyG49jssHPbfhdMlA=;
        b=BnjGgZVYEI/L4ijpHos/GPRPxE1fwo50UnwEr3mvk73j/2fPZRXnp3hynLyN6R8i49
         u3DDp8e40fcRwbb37ksjnEtiVeG7K5COOEDXhuO4I44x3fdUwSxLfUXvkty2TSpdCkFh
         Dj58nlXZ8CQ0MIre2BcDN9iZtkQZJOZ36+XA3Pn73GXzBgw22YLBxi0cZ9cR/TB3BNWh
         XqBLbO9SKfhLlXDWnWyEggUc+CfVXFJlBYYCrbuIaj2df1hYeX1dAjNgNYox14wo1PDp
         G0E/0Ya9cEBGqINN1uCuy/Bd/p6fgd9XM0wGlGZqc0Cf5bQA5rn4ghl5cO+W7E//fEIY
         9tUQ==
X-Forwarded-Encrypted: i=1; AKwUvBym/5C+Ho9saPQa7GrI8XRcH4gWvXaz0hOccpHCuEreTe3GAI0p4+kSZPZhbHkF6u+yGUPm7C+E+hcr7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIeQexa276qW5Bpb3VWS5xL5s5Hxt8mFIskNalOMvWOAmS7iWSF
	g0AKm+RTCoJnmN5fd6gNVbheINjjjY6geRqG07PxPNAJqdmAlr8rp7tbp2eJSY6mJZA=
X-Gm-Gg: AYBFou3RByvlHwWIAoL8OqOO1ZpJ16JcLQ+2Fy7tCNHjvAAdjpej/arxv5+M3ZjfY8J
	PFQf3tImup5e7Nmv1mxSSrpmPwRTB/+CaSwO5pFtdOeOH7AFqyWW6zbgSnkevaNZdjgYMQCp73d
	bpWm95szS9hre4sRl/CGVfr3GYrlmpQNbYQF5WcI7TcsGDTckM9X5l4xisOjTwg/PUPaUCNFTx6
	iX3ylIZARGI5YcywAk3TCZFP9rGBWwc4pLkkA5ZM7dMpZK41FeMwyCdWBjM1yhu5wwRmBX8GC0Z
	AmVPOvx5eusd6ffEPYGJYFiuuG9cxo/hbBRv+bRlftP9uI6lEnmqOZYbJJ1h0QyidTUBoVQtHM1
	fg5roItrOlA/0PWRtiDQjT6QKaBSRFywKXccWVByyGpJzcxbVv6EDMD9ak2HB2jsMn9b2KMuXYV
	WuBn9/Ny3ssUMRGSai2CM0fDu7VDFbYn9sU33cRBXwtoFjVT7b4/vhRTlJkQpnS3Xf5V0mx98pm
	+0JSawuIvXq/QnojTeHSyPhOl6p1DUAmBpel5vD4odN3dG61mSC9rWMZcQvmorzfmelEHGbt3G3
	RF0KEF+I/NX3BcrCG8T0kqwRfC/J7ZJchBAQjPisuR6I80lZ4zgRPTwlvIs04Wt8HT3zYj58jvI
	BIq4PkWqdbeRyVyI=
X-Received: by 2002:a05:6512:4607:b0:5bf:ce1f:cd22 with SMTP id 2adb3069b0e04-5bfd94cc517mr1665400e87.0.1793445741887;
        Sat, 31 Oct 2026 04:22:21 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:21 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] media: qcom: camss: Add SM8650 TPG support
Date: Sat, 31 Oct 2026 13:21:57 +0200
Message-ID: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains 3 test pattern generator (TPG) blocks,
describe their register spaces and the non-real time CAMNOC AXI clock,
which is needed to be enabled to get TPG output written to VFE.

Interface to Qualcomm SM8650 CAMSS TPG v2.2.0 is similar to the ones
found on later platforms, hence the functional change to support TPG
is extracted from a change done by Hangxiang Ma for Kaanapali:

* https://patch.msgid.link/20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com

Hangxiang Ma (1):
  media: qcom: camss: tpg: Add support for v2.4.0 TPG

Vladimir Zapolskiy (5):
  dt-bindings: media: qcom,sm8650-camss: Add test pattern generators
  media: qcom: camss: Skip TPG if its registers are not described
  media: qcom: camss: tpg: Support TPG hardware version 2.2.0
  media: qcom: camss: Add SM8650 TPG support
  arm64: dts: qcom: sm8650: Add CAMSS test pattern generators

 .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 16 +++--
 .../platform/qcom/camss/camss-tpg-gen1.c      | 24 ++++++--
 drivers/media/platform/qcom/camss/camss.c     | 60 ++++++++++++++++++-
 4 files changed, 106 insertions(+), 18 deletions(-)

-- 
2.53.0

