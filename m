Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055004;
	b=RlinG1ZAl3NjQ8wVfmka0PvVy8FN19sZ+RZfWY1++JGKecwYjz48s/bKFPVpdEzQiI7f
	 FjIY6QDHuVEGvL5hzjKl/objg+HgiTzDGXfEUG7e+oiP3q6y5UA5iwjgrWSGOx7/rpNVH
	 PYybuUk6JUdVjzOPkcDMwRGNlq7syAVhg3qfW0PlNsO0xivDhUbUaMT/aF3wdJ7plEd7P
	 QMMewqTCF+B+AraocDbw1pnEvLAN8YwW/JYj1xBZbWXdFb9xWlox01TB1Qk/3WMMwkKqi
	 RcFqzFom0EDc7t2mWcHg2DVOyeUHpTN/oW4KUI7xuzlogLlplM4q3N8I43u3AijBEoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055004;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t7JehZMn3Nl/lxkYG/xWHY5X5HT1Ppoe07eraMxeFB8=;
	b=C+fTKfXSwQFjAeZ3xq/+zIPJXNvetYhj3IQnFPy0BKYzPhX9TugrcfLmALvTP83wwFMn
	 nGqoVL5SMaz05pHhiYq3qlQ8XhJ9eQrq6FNkesEAQWm+lQMqrSlhfSmQ+w742yrONEcKM
	 RG53wFMxam2vtd5RdLV6nnEOlg71VG6P4lp2iZ5CL+6rGyRflx8QQaTZl8ZT3ictx3NDl
	 5cPAoYw3srWayhoAufKKWgqK07JpOcMoBtyEYVGakjirGihYnQTBQqtfEv4AF9NQzls3S
	 3OJICgmKGhyDz50SpsufcZyktsUQIihkH37s1BtcPby1uMgmuF6zY7CocvIvPM3Cx1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OdN/9mtj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186EE606A31A;
	Mon, 26 Oct 2026 22:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OdN/9mtj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7FF1F01825;
	Mon, 26 Oct 2026 22:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793055003;
	bh=t7JehZMn3Nl/lxkYG/xWHY5X5HT1Ppoe07eraMxeFB8=;
	h=From:To:Cc:Subject:Date;
	b=OdN/9mtjOk1dKJ6xkM1gNYxz2hYE+Sd1gZtHVyuGFOZ38XHV7tm187e5xxlR6Hmva
	 a9fzW1SE4muojYgFTd9AecGrsycLE7bV1hEnFOSUOr6iG6JcnHDuoQElakfZZJ7iws
	 VJxxi80KiVRpySfEYTrQJMqfpkfVNPYcrdM2o9xi0y6pJhFE2HG5A7MoD95/E6RYmq
	 Av3c3Pdh0jPvhvb3xIvmg6dhz56YMs+yQm+JJXE+ZAg3DYGop0yUFedFuedTWrqXKM
	 6jL4j1CX/7oTM5B8aNVy9vEBFVO7RMqQhCgbJ+qhIAtXGSWiqqm0fnln7qqs69wtYw
	 WL9/3QR/rmNcg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] media: qcom: camss: Add SM8450 CAMSS support
Date: Tue, 27 Oct 2026 00:49:50 +0200
Message-ID: <20261026224957.1115370-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
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

This series adds support of Qualcomm SM8450 Camera Subsystem.

The CSIPHYs are described as separate CSIPHY devices compatible with
X1E80100 ones, there is no legacy CSIPHY resource description in
the CAMSS driver, and this option is not intended to be supported.

The change can be immediately tested on any SM8450 powered board by
running an image stream from TPG to CSIDs, CSIPHY IPs are equal to
the ones found on Hamoa platform, and were tested on a private board.

The series was based and tested on linux-next-20261023.

Changes from v1 to v2:
* renamed Waipio SoC name taken from downstream to SM8450 (Krzysztof),
* pushed DTS patches to the end of the series (Krzysztof),
* added Reviewed-by tags by Konrad and Bryan,
* minor non-function commit message and blank space changes.

Link to v1:
* https://lore.kernel.org/linux-arm-msm/20261023163057.775917-1-vz@kernel.org/

Vladimir Zapolskiy (7):
  dt-bindings: phy: qcom,x1e80100-csi2-phy: Add SM8450 compatible
  dt-bindings: media: Add Qualcomm SM8450 CAMSS
  media: qcom: camss: Allow CSI2 PHY devices without CSIPHY resources
  media: qcom: camss: Add SM8450 CAMSS support
  arm64: dts: qcom: sm8450: Add CSI2 PHY device tree nodes
  arm64: dts: qcom: sm8450: Add CAMSS device tree node
  arm64: dts: qcom: sm8450: Add description of pins with MCLK function

 .../bindings/media/qcom,sm8450-camss.yaml     | 274 +++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml  |   4 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 565 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csiphy.c  |  16 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 244 +++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 7 files changed, 1100 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8450-camss.yaml

-- 
2.51.0

