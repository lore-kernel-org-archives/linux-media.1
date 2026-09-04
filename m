Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72D48CD6E
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519407; cv=none; b=GMgdsfC8x5iDQb21bn9cX0vMcRcdM//YzpyyO6P4cklVYnOBKPnBVwbc5/zCJ1Llkka+BGvkA4bqkhZkkoOKCt702oiJluHCFPfJVYF8SCF+rk6W1vPdXyD0VNSPpnHo5hgPHlCuWqHxHOh+2koHYnKGnhL5uKOQWFZzloyOnao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519407; c=relaxed/simple;
	bh=uiT/1N/57CYf6bbnzJtVAQp7H78fX3pL6cB59/IK87s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SN3Eehe3cav4u49Q8XyH6dIGU9vDp/C1MrnlSknMpQRjVoMmAG774INwU2rFGEH2swuYmhiMlPB5mL1IqoMMsPXoOzxGTKvI1TAAMCaHVuHmacbg8GeyhIlcgCIN5ZUErhkydx/0L1WOqoXWplcn2Jgr7W7ThWuxOJHPtipZMdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4VHPYI5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4VHPYI5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so8167835e9.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519404; x=1789124204; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqoYUfqoUDK8tcft0dL/dSMTYzsP1mK3ezFgAfLU+J8=;
        b=c4VHPYI5ZcdNyAaALuXqanH5muBf8976SWRd34MlpaGGrzyvJRpn7rnWUZ5QY6f0Sx
         3FWrBWtUV7opxqyz4tIam7BhFSikwWbyZ7HwUhMtJUlxJ9AElh8Axf3LBYPT3wSnXEg1
         +fZBlqALSm/CRPsEXTsAtDLMekQbh3ckCSuUWxUPgq0UumxuVPtzYLTCQRaHS5WyaGD0
         s23ZgYiKO+tGiviObneEWBT5r96Gh6o3A0x5IT1aeSsmfBbOoyv8Z/VSF5O0D9Eg4lwD
         cVTqNVITh+2YGq2QBTxD7YjvRLcshyZzCa+N9DAp3/B8oS9Sh/tyigR+L0o94+tTfsFR
         9ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519404; x=1789124204;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqoYUfqoUDK8tcft0dL/dSMTYzsP1mK3ezFgAfLU+J8=;
        b=Vm3bhFW3QIIe6Z632P/p7PtNQiCkuGQ0QYw5Q/3VFuDAIIKiuDufn7hEzuDAvR/Gu0
         wjE6YYoQm+EZwrX8j/K2QZVQlq20ow3H4koBhvMlvD5ZewyN3sSLLYv2HqphFxS71fgX
         qzW7IgPDU+jdTtrKjFqsJfv5v7fmdkP5sivkAuF3XFNR7uy0vJBUeoNx2S1wl+rIa9/S
         y6nuxP8kd5NTamfC4cDMa4blEh4z6FHX8me+FRc3X1zWCbCxb+SO0xWU1G6bwpr9XSSn
         WjBm5sqqcZ8TiL/t9QHOMu3As9zNyLzS2M1e+vWxQ97hlYK0bubWEMpu9ktrtzd1bDOG
         +waA==
X-Forwarded-Encrypted: i=1; AKwUvBxabogMHSe1EZI7HDnyu7WvJJbZ3f1hjW1+yX7GSgr1JBbp7enKBnO2ZJpD8OtVyfXGNy4XscLZxomZug==@vger.kernel.org
X-Gm-Message-State: AFuF++lzBRaD/jzPT1t7yuSYRjfacGzs8PYIjn6M8MOM5cpHCYZj2N1N
	xQezvv0LjXBqIEWxQBCX7tqu6rTchUF9/+rNvq8fhInY1y741H0qsyyFQT88FK1mbLdzxen2Y4Q
	27Am5Yz4=
X-Gm-Gg: AYBFou1Fnz/+b0vAgzl23S3OiSXQdTWwwDGBg1kTA9gFk29pI3NA0/lU5RX9Ankwi1n
	HQEAD6/e/9TMHOUJC/CrBu0jrnCs3UJrFRlfK3Pp3Vlwy+tc2cAxNl2Yg3L70qxk/VNhFlTnlyo
	XCgpeI9UkqdIRuRuVCjOQZAeJwVxIY3I7W50qQQZAPFHlCfpdR6AwM7yZMWavfTFqNrTD6PkJex
	Aqij38N6peZJpL2+X2Vcu1h0sKowC+JRgjfo69s+sMS02CwC2ojcOL1AfN+MuocG4ng1tIiHOi4
	U0DaRQeFIo2PZpbB9PMx4zbRo/oXHbe7mywvFUZAF9SAAQ21Sja+wMXWFPbHkIUigP+uNCvCnRX
	U/rpNXb1X3oRskx+uLIkuDahxn0Q+g45G3RUYrRGEi4TIlLbXmn7VqQcY4ArlAMuNVToAMqxpyn
	r2K8xlrFX075AFobRdnFtFDWo/uP35zX4H+MAFlF5orxaRGya59J/7s/FMmhCHB3MzYJ1FaTtS
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr54709275e9.15.1788519403840;
        Fri, 04 Sep 2026 03:56:43 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 00/13] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Fri, 04 Sep 2026 11:56:32 +0100
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOzQrCMAzA8VeRno20abt1nnwP8VD74QK6SStDk
 b271cuUoR7/gfySO8shUchsvbizFAbK1Hcl9HLBXGu7QwDypRlyrDhiBVcRwNlTzuAyIZzbG/h
 LJtDojHbcK28NK9vnFCJdX/J2V7qlfOnT7XVoEM/pf3MQwCHKWHsf99GoZnOkzqZ+1acDe6IDT
 pAUPyAskNFNsazWdcNnkHyDfn0kCyS8to3klRCVnUFqgmpuvkOqQLpGqYz1Yo+f0DiOD+ZbU+q
 aAQAA
X-Change-ID: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=uiT/1N/57CYf6bbnzJtVAQp7H78fX3pL6cB59/IK87s=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPjR1I+bbLVsa+gt/CODo03l6b6MQ4GXrM/i
 dtysfqq30mJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj4wAKCRAicTuzoY3I
 OhiMD/wI1Iixl/iy8tQrnaL3GGi0qVg2J77BsKCM/ZBffjYUzBW1YrrlrTVHGeNiUG7o/9QSZWZ
 WVrCc4tF+CV/kuRyDu5VXaZ1VPCiDEOAKz0IhYkt9wBfqrHjU9pIzGd9pVt+mjNGQNA4SAkhpuo
 vqaitOzHaUXS9yzz4bSPPX7VBDLyFJJ54M/9RHhwmMpOCQwtuS6LCVBRcw4AeuCpMPUaVQdK+tE
 aYANGFzbcgXO6hl7QiE6u3tJjCeCGYexmMjqB3gVoxGE4GsNlKiNEtAT27uriIuUGGtQ642opFj
 QvuJ+0P19oKWvTKBusfmhXImVtNz6hw7YzDZh23W5Cx3gXCyGWTBpapZqMjBHdCgJyMTzuo6hYe
 v6/2lz+yHGyCqeZanJ2t2UHj7KmFLO/pTXwr8kYoQD8Rf7UYnLCq0BBhhBOLeNpqr00sq3Y8gTQ
 x1O83L3tGRDeqh0AIlFReJPzeh0xe3EDTYo6oKGxIqYixwWM3D+kXoNSRsmYqbA89ckCx/0xLBf
 kyRGrR5THeMskQJA2CKyl5/9k32UwPmqlx6k+xymYBgUR63y5S6mH4tjFpJVqp7xfcx6IpJuzVd
 WQBovJnvMl1GQAMt6d+6FaZ2cHb0S+gstpGjt5kWxgbxbYzsIrFJKYfCC0URIX/k0HPXnp8l+Zi
 f/04yR18p7+HytA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Changes in v5:
- Adds Konrad's RB as indicated - Konrad
- Shifts DT from vdda-0p8-supply to vdda-0p9-supply as per schema -
  Krzysztof, Bryan
- Reworded commit log on the optional supply change to explain
  standalone CSIPHY nodes carrying their own supplies - Krzysztof
- Moves yaml changes from PHY series to here with the DT - bod

- Depends-on: https://lore.kernel.org/r/ 20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org
- Link to v4: https://patch.msgid.link/20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org

Changes in v4:
- Implements agreed port/endpoint bindings in CSIPHY series
- Depends-on: https://lore.kernel.org/r/20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org
- Depends-on: https://lore.kernel.org/r/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org
- Link to v3: https://lore.kernel.org/r/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org

v3:
- Too many depends to have this merged in this cycle plus some review
  feedback on the depends patches but, for the sake of completeness with
  the other posted series - posting this now too.
- GDSC dropped - Konrad
- Clocks dropped and renamed as agreed - Konrad
- Using mode PHY_QCOM_CSI2_MODE_DPHY
- Changes ldo7 on Slim7x to value indicated by Alexanders
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
- Link to v2: https://lore.kernel.org/r/20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org

v2:
- Defines CSIPHY as sub-nodes of CAMSS
- Includes updated OPP tables for those PHYs
- Fixes supply names for RGB sensor on slim7x

- Depends-on: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org
- Depends-on: https://lore.kernel.org/r/20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org
- Link to v1: https://lore.kernel.org/r/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org

v1:
Add the dtsi for 
- CAMSS
- CAMCC
- CSIPHY
- CCI

Add dts for RGB sensors on
- x1 crd
- Lenovo t14s
- Lenovo Slim7x
- Dell Inspiron 14p

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
Bryan O'Donoghue (13):
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      dt-bindings: media: qcom,x1e80100-camss: Make vdd-csiphy supplies optional
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition
      arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
      arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 voltage regulator for RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor

 .../bindings/media/qcom,x1e80100-camss.yaml        |  28 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 489 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 127 ++++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  82 ++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 159 +++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 158 +++++++
 6 files changed, 1034 insertions(+), 9 deletions(-)
---
base-commit: 5176d213b3d4405ee5a9ede7e9eb876368beb994
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

