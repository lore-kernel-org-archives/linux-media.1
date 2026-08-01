Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB6B37F309;
	Sat,  1 Aug 2026 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594711; cv=none; b=iEX/spJJfhbQ7KTzX7QktD2m4PwHw6V+i1KBUs1CEZHJCiW/3G8Lnq7TrX18VsXweZota2hqCvJlH6ziNQqkqKuRl/YwQtEEi4lUhiIg5cDFinjpcO6/32SvcKuNdmBv6J8ng6myXo2RdIVz0GG07drS8uJBu+/x0j/xhYrPiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594711; c=relaxed/simple;
	bh=5hl/pBLJXccHg/JUpgv3csBy8zntlmqOZFz1bhZixaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lywDGO5liHgkDZ4qe43ktIxGc/RLBlPfDbvPhzZitKUy6Ip98NQOdaSNosr5L7AuCNXoSDLWW5I8OG6+cfE2VNBiBzI/DgWmAn4tHGuWFlen3c/cGC8OaLmqhnj3qRmvNfSTc91ixaQMKvU7hWlFid0yO0k7mIU90Ju/LAH8EME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pYL5MLmO; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dCAj++P2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pYL5MLmO";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dCAj++P2"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1785594690; bh=/FAYu0Bw2fGu114Bw5YYFgp
	3P2xihTchd4jRDJWqS5o=; b=pYL5MLmO+Qbih1DPukJN6xe7rH35of8xazZfSUDlB2EdG0TidP
	WDBDdKYWHylTPN19TXXwbjTLJOP5f5Jt8lt1Ww2ZYkdVL79WlvqeDV2CPcx/RtcknQrclxBxLUp
	buTNaGt3A/26HRnkrIZFTirdnRPD0HWOFPkhfhkVmQ9fOdnRgtlSLEFsI3aeYicvevZecg+lBrp
	A1qya4sQNXwUSPX8SH8fI0+OKm2ptn6n5MpzDvE/mn7EPEvOSxWTedbwV/d+CjGIvTSzkSkO9Qo
	iJbYxyg/hSQNgqRM0Au3N0nLwUoe0srGZM8NMHyru66UNi2L0mYUfpSDg/xalk1wf6A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1785594690; bh=/FAYu0Bw2fGu114Bw5YYFgp
	3P2xihTchd4jRDJWqS5o=; b=dCAj++P2coVB2z61G1ITj6OPjpX9c0ymI0lvzmXga8RRIjLBk5
	3DUXkXXlHlLQ7BgHxlNhbrmBxjwIFQwh2JDw==;
From: Danila Tikhonov <danila@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Vasiliy Doylov <neko@altlinux.org>,
	Achill Gilgenast <achill@achill.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@mainlining.org>
Subject: [PATCH 0/2] Add Ultra Wide Camera Support for Nothing Phone (1)
Date: Sat,  1 Aug 2026 17:31:23 +0300
Message-ID: <20260801143125.267054-1-danila@mainlining.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Samsung S5KJN1 camera sensor on the
Nothing Phone (1).

The sensor on this device is supplied with a 19.2MHz MCLK, while the
Samsung S5KJN1 driver currently supports only a 24MHz clock.

The first patch adds the required 19.2MHz MCLK support to the driver.
And the second patch adds the Samsung S5KJN1 camera sensor node in the
sm7325-nothing-spacewar device-tree.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Eugene Lepshy <fekz115@gmail.com>
To: Vasiliy Doylov <neko@altlinux.org>
To: Achill Gilgenast <achill@achill.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
Signed-off-by: Danila Tikhonov <danila@mainlining.org>

Danila Tikhonov (2):
  drivers: media: i2c: s5kjn1: Add support for 19.2MHz MCLK
  arm64: dts: qcom: sm7325-nothing-spacewar: Add ultra wide camera
    support

 arch/arm64/boot/dts/qcom/kodiak.dtsi          |   7 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  47 ++++-
 drivers/media/i2c/s5kjn1.c                    | 183 +++++++++++++++---
 3 files changed, 204 insertions(+), 33 deletions(-)

-- 
2.55.0

