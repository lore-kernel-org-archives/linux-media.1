Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773083;
	b=hu74K9wq4/ehnFHwKiUiVztTKdatFJszR7Ws2bzir5Ah1yloQhc94Izho6ZNQmO4X7W7
	 KW0iW+gVPeU/IHV2CIDwoOvocnaiu5O7WMCv1F+k8sKBEEbq/lVUvDbQ74f4ipNahJW77
	 GidZy4JWa5jj1xGm+G3VDTM4cTfX6WPXg/wkk6AXnLoXx2NgrcD2xZwsIhRTPz25lzk4A
	 CC2xe3a+/tuuNaT/2tiygjDdDhey9ovEKtC1qQETrRpfrYX+mPfSmkTEBC3o68lpB9FQR
	 zW5RmsOtg0hzX8qqSIbUgVjvqXTR/pd4WcTsi806Tkv8s88VF50tt1dYhMEBKd0DpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773083;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Q/WZXCrhzRC1pBbhEEk9GmXlyfcA/VhGiqMj+3Fzos=;
	b=46RIPn9hYjPVKVxaGCNxTFq7n7gGrKj4GNF+xLm1/LfZa0jUUAw7NXys1+YNB0XceIgh
	 tbm90w4xs1UQ2826QXUcnSzOdkY171JI7uuVj+2RVcXxj507WgZASX2wbtFcCfdyAE5So
	 FHIrsLmd+avVPXgU7drEhFtNdKFbU5SVgq0GMLlwXtshIhsWEMf47miGhUiiLsjeKAWrJ
	 ca0/RL82wQB3+QMIHkZTsmbY4P83BfvkVcGfhsIVynjopzJlagkS8+AxlgEAv4nQsmRKM
	 /zmhvXDzlyFfRD+52mVhQLkZMFIFRMlpJaxI4eFAt9QrOgMehAWHerE+5x0gfJvsNtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NG3cLh6z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6817606A31B;
	Fri, 23 Oct 2026 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NG3cLh6z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05391F01825;
	Fri, 23 Oct 2026 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773082;
	bh=+Q/WZXCrhzRC1pBbhEEk9GmXlyfcA/VhGiqMj+3Fzos=;
	h=From:To:Cc:Subject:Date;
	b=NG3cLh6zHDvkcesr1fj0IE2q7fkHJ9nXBGQALLN3F75CiPLs14mUTUjJwiKlYvJ/L
	 iPapmbpENcZU9suGxHW3cKb9IOs17f2s9Pe5mV4nu62kd0+g3MdE9yOgm/gyOI14PJ
	 yEZjuEdewpbQIcLeXlrgP4pRhBD8g8bL1kCYk6D3X71fDEg0jKBwz5IhJDRWUFNOpH
	 tGMO86Uwf00opaz0OhFsoneQwTFcq0YfLf/7Qlc51s1S7MRn19fyq1+WalE+8/46BY
	 3iTMRVfs2FOXwM/zeaQwODXodM2ijh8vBVf2RjwQNEcmYXkDaBQqDccigFgYttl6Sq
	 0o8qjC+aVb4vQ==
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
Subject: [PATCH 0/7] media: qcom: camss: Add Waipio CAMSS support
Date: Fri, 23 Oct 2026 19:30:50 +0300
Message-ID: <20261023163057.775917-1-vz@kernel.org>
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

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

This series adds support of Qualcomm Waipio (SM8450) Camera Subsystem.

The CSIPHYs are described as separate CSIPHY devices compatible with
X1E80100 ones, and there are no legacy CSIPHY resources in the CAMSS
driver.

The change can be immediately tested on any Waipio powered board by
running an image stream from TPG to CSID, CSIPHY IPs are equal to
the ones found on Hamoa platform, and were tested on a private board.

The series was based and tested on linux-next-20261023.

Vladimir Zapolskiy (7):
  dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Waipio compatible
  arm64: dts: qcom: sm8450: Add CSI2 PHY device tree nodes
  dt-bindings: media: Add description of Qualcomm Waipio CAMSS IP
  arm64: dts: qcom: sm8450: Add CAMSS device tree node
  arm64: dts: qcom: sm8450: Add description of pins with MCLK function
  media: qcom: camss: Allow CSI2 PHY devices without CSIPHY resources
  media: qcom: camss: Add Waipio CAMSS support

 .../bindings/media/qcom,waipio-camss.yaml     | 274 +++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml  |   4 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 559 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csiphy.c  |  16 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 244 +++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 7 files changed, 1094 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,waipio-camss.yaml

-- 
2.53.0

