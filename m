Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835955;
	b=O0lb18oDMFHW9Rut4hPOh1H+jJjhkr5ajjZciPQ+sYxbV7tpH8a5i2dFf52cC8OIIsn9
	 bxEix+azKtRkNkuqke58DDkULIKvpyEqX3zgbNvT3rTlSwMP/qHahQBQDZb6OxdPZbuLf
	 m/ezO4iS9iif6J5LKLv48mR3ho2l0WVsWIN5WQ2IsRx5nuOcDFviJhbyjvIhJ3BtAhrZ6
	 J4bYGhWHS118iuMswrig9xu75pusjjoXPcpBpvElU9naJ3FAcQTaqPCQYeqYVCdcjzPnR
	 zUInThsb8556BTbHWO41RTfoEZ53K7J9wJM2rhIRpecTOVdo31ifVxM2VTkmWv/9RHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835955;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ve6b2UVHi7FP2TZ+y7CmR1QFKaOIvCRQOPuTaJx8TDM=;
	b=LBuOu9v3vJeVe6bzvpgfe6WF1CNIWjfDP1HxU/z7qnEI8IsuS43q07IsxperscjV838Q
	 kuxirUTdPbTgw/7R5hdMq52GB9eDPQD/WyHWv4+CDPwboUMBgqK6HC96Npqp3r5nhLRe2
	 ZeY7GdF2v5CM3F7NQTy20O4J+7yx2cKE2MZn8UgRHhiaxVkGFWMOgdy8LOGFuk8J0LsSf
	 YHryc06mPlxzCgg8cikvzLQLOpBcYsWdcL/rJ+PSEaK62+7YqXn/A4lGoq19xxtFFNuom
	 u4XK/TO786UdntsSoVe8YgUUj+rwXwG9VgWWTBwoI2VzxCRgd1gmB/3YB9rYJcs9bVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=homWY4Pi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0EF606A31B;
	Wed,  4 Nov 2026 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=homWY4Pi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595E91F000C1;
	Wed,  4 Nov 2026 23:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835955;
	bh=ve6b2UVHi7FP2TZ+y7CmR1QFKaOIvCRQOPuTaJx8TDM=;
	h=From:To:Cc:Subject:Date;
	b=homWY4PiLhY+HW2qKiJlPvCcnL12tR3laLxERSh1/mDlzJ+XpspTrPleLYfQEZKTO
	 OfSujol8UwTdRL93wGYwWaix1l0lrxD+3hO93ck5PVxQzTd3b1504lQHaycbMyQ3pH
	 pryO47MN1y/xKGDXf7Wt4wZNwMp3nPfrogZdIChl9PFmFup16QOMDUqMpmA36pmoGE
	 zRZ1PWPeQLJOtF1c8hjCEpnIjN54V186zkYsjVS8JLVvlHruh0AVTTMu2oxeReH/xa
	 qPVNqXGOMzaYd3dGgdQiQZ2+VgU93At/tt6qTXOAjDUUX1p1SXqteD/C+QYLNAUMXf
	 bCwpPSMANGnGg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/4] media: qcom: camss: Add SM8350 CAMSS support
Date: Thu,  5 Nov 2026 01:45:29 +0200
Message-ID: <20261104234533.3044265-1-vz@kernel.org>
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

Add support of the camera subsystem (CAMSS) found on Qualcomm SM8350
SoC containing:
* three CSID and two CSID lite blocks,
* three VFE and two VFE lite blocks.

The SM8350 CSID and VFE block are programmed like on SM8250.

The series depends on the SM8350 camera clock controller support and
on the change from SM8450 CAMSS series, which allows CSI2 PHY devices
without CSIPHY resources:

  https://lore.kernel.org/all/20261104001704.2744766-1-vz@kernel.org/
  https://lore.kernel.org/all/20261026224957.1115370-4-vz@kernel.org/

SM8350 CSIPHYs are described as separate CSI2 PHY devices, and their
support will be added separately along with their connection to
the CAMSS input ports.

Tested on SM8350-HDK with the CSID internal test pattern generator,
the GCC camera HF AXI and the IFE lite AXI clocks are described in the
device tree bindings, but apparently they are not needed to stream
from TPG:

  media-ctl -d /dev/media0 -r
  media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
  media-ctl -d /dev/media0 \
      -V '"msm_csid0":0[fmt:SRGGB10_1X10/1920x1080 field:none]'
  media-ctl -d /dev/media0 \
      -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/1920x1080 field:none]'
  CSID0=$(media-ctl -d /dev/media0 -e msm_csid0)
  VID0=$(media-ctl -d /dev/media0 -e msm_vfe0_video0)
  v4l2-ctl -d $CSID0 -c test_pattern=9
  yavta -B capture-mplane -c10 -n5 -I -f SRGGB10P -s 1920x1080 -F $VID0

Vladimir Zapolskiy (4):
  dt-bindings: media: Add Qualcomm SM8350 CAMSS
  media: qcom: camss: Select Titan 480 CSID offset by VFE type
  media: qcom: camss: Add SM8350 CAMSS support
  arm64: dts: qcom: sm8350: Add CAMSS device tree node

 .../bindings/media/qcom,sm8350-camss.yaml     | 262 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 110 ++++++++
 .../media/platform/qcom/camss/camss-csid.c    |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 213 ++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 6 files changed, 591 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8350-camss.yaml

-- 
2.51.0

