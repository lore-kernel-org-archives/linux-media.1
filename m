Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796B4B4883
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651241; cv=none; b=n4Xr/HXeNTeY7k+tBkCmFJx5OuM++8RO5L9m3ZCr2MYyRvoLIynd6GGaKKDWvtJkrhHhFkZ0OnEPRuzNQQbZEqgZGKKv4PDuGFA7reLQ2NMLzbxJ7Ou7Z24aAnyJeWiG9fkfnUwrF7a/gWKcBXTF2FodpEx+bb/cFpuWWKKsN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651241; c=relaxed/simple;
	bh=8L/huoQ/bmz1h6OsAxXqZVB8bP+8lDrveEEmGNFKfWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RXzu1g1tSzCSJGqHP/1VOLTCUc+PhJsqNP6x2cppu+u/AvyKftHTrZVE8l7iMbHEM1RhhEeDjmVkbP+I1oSDic4H384YVJ8zdDZ2uvsXqiPEoBR9Ehn+kDqXNfunZ/dgmLVsHLHIitL8lMfzEqXme1CKJ18GoBuNTbQqIG8hIOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JyA0Iu4Q; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JyA0Iu4Q"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso116265666b.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651236; x=1790256036; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XdLSei2hEl+Rbgqu+Euiunc84HR7njVZ9JOx/sdZ7gI=;
        b=JyA0Iu4QQ4rr50FtD40cgKQJFktcpGjlWOHq+v9M7my3auSZZKdIN+hbjBl2Y6Dj75
         a2PVI/K9avwbyz2zd1evUyVAwz9NYTG/E9qFrHqOS/yTwV5Q88CYoZLovoSIXZb9+y3d
         MROF9Z+VTR0duh8iZGahPR+2Ume95RYSOyN5ZrqB9rxYd8PtM73gXE8MHOqb1/MhLq6J
         EAR6zG2VxDWqT4OBapouIv4z95PVWjkrngL90LkH1jdFhWYAEdNDNKiv4oEaw/zlBYwg
         wqfTzBHaJxGBRYx6XCkqfOMy9LTqeHdajXIgbjTh4JkfZyJJzeyHCTYVGnQu/sBX0ffP
         zQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651236; x=1790256036;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XdLSei2hEl+Rbgqu+Euiunc84HR7njVZ9JOx/sdZ7gI=;
        b=n/x0N8N9YHIE5s0+05lxqgCjOIjAQl+KI/PZjRfOwkCifUzbJtOzrOFV0432wv8+gE
         Szc2dKsJgKBRj5cFB4NeUudEa6sl+s3USgBUpM+ikPtbMFIFewo2Gfk3z4X895OYHOuz
         ur4ODI7OyHqbAgZ4IcZusONPKj1QBQQX+lhxgdYhA25ElmWKaV5XGpHoOpMTqOD2sA+9
         LMHvr2AUCfKJQmq0p9vM+JWB4YWxV3P1KZbDdBQNObKyBEk2aeKyUIEG5asV82FYQPw2
         ZfMvFL0OXbJ/5yp3sPPLndGAa97gbtcyaHUKDACk31zAXz3YvBc1zLehBVtXTQQUZogx
         +ljg==
X-Forwarded-Encrypted: i=1; AKwUvBw2rWdIl3vVR3CEZsoyTr1dAR4E+zK6vR+9c6kmUKSR6/nyOPV6JVFdQT+G6S7/yXnoo0g2U+mdtNr2jQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lipVa7wEb2bQj2VsfWwD+dTTvjs+N1mnkkFHbuOJojkpLNEWHc
	uXwz/F/CfsAz4secy2b0KcXX1RcaRaUqhgF/bqXbOdug/l0W5q5muz501SwMbsZ6F9s=
X-Gm-Gg: AYBFou0Q2pegu4O6aywJ2+xR8LjVrf8u8cPxnHXc8uSdwEZuRDKa0xVRrmqrpJovjL7
	HUW3GtcKgR1gedhJPD/uXoeih52vhJlYepdZsOH0V4v4DHTom6BDnpL8cPYF4bDTzNpsYLSZpJa
	Qbo/UJmMWv8YrUj1MMpGFGaqKQP+rfqltw1zjZw3B7kEh9krwiPJvIND8PsNscoInj0iSDORVHT
	l8hXhhP8DHCyS7UHko2uzZtTD1LO8cYYpMZ73wNvNUl6UCUruVrxX0+mYjiTS478zp42D+HGKF3
	SMTXamJQ28t+PpAAfyZ03Ttjh84k2TY5tCLz/We9q2z3o8UPrbXcL1GbecPz4x1/gWrlW3Z5rIq
	BNepYuCK10gIxJ4xKJFfQnqOB+yHhQcYIe1CNgMm7ggWyJ9Z7R7qLpejP7a1kZTxv21APDq4tvo
	AwMUlV47vlRNwzrexaMMubtNDBAZmETVQbkFyluVnIKs5l0I1eKEW6JLg63e9OpmEO7o1+eVg7y
	crMnAe26Q==
X-Received: by 2002:a17:907:9304:b0:c25:437:3dcf with SMTP id a640c23a62f3a-c29e527946dmr483012566b.21.1789651236393;
        Thu, 17 Sep 2026 06:20:36 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:35 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 00/12] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Thu, 17 Sep 2026 14:20:25 +0100
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQyW7CMBAG4FdBPteVt/HCqe9RcXA8NrHUJshGE
 Qjl3TFcQhWRHv+R5pvlRmosOVay391IiVOueRxaMB87Eno/HCPN2DIRTGgmhKYXHmnwv7XSULO
 gp/5K8VwzBREsBIYKvSWt+1Riypen/H1ouc/1PJbrc9DEH9X/zYlTRpNMBjF1ySr39ZMHX8bPs
 RzJA53EAkm+AYkGWXDN8gDGsRUkX6CtjWSDOIJ3kmnOtV9BaoEMs+8h1SAwQirrkXdiDcECOab
 eQ9AgDJajhQ6cwxWkX6GN03SDmDZJxBCUln9/NM/zHdVwTwUsAgAA
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
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5227;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=8L/huoQ/bmz1h6OsAxXqZVB8bP+8lDrveEEmGNFKfWA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+keOb9k87RQahjCkkq0ft71UAJ4ZiWD54HtH
 ZAT7FfPjl6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpHgAKCRAicTuzoY3I
 OoXpEACwvXMkWKh0cbMuJ8hKAXA8TsU6Km9ZAPxOcWluQfMO9wXYf0TEREbx42TzbNFADMYHuYe
 N7q1RZNl7OoiCYSBfnIfUsD6qJDqhJ8btGmyF1txKovin4T1MPFcaJoSS7kMjLVqeoa6BFA3OYr
 s4KWlnOSLcJqcWiOexA5MDz7C4S92Qr+8NFC6gyJnKXYtTGhnI+2MHc+EIpMMUH0jXsfjc3mUh5
 pv2dASzT6TVSMNN634ZxBs/1Zaui6AWcvUVPvJEdKbMeVU7ZU0IPlWrz/vWm48dQOmneNAlh9t7
 zca0xAUBI6aCPH5rRYaatcATFstfpV6PHoZoP8cohtfcyl4LbvyP1mGLilI2JKZUWnfV8a0mlsc
 33XTuIFW414ErpFHtCguWNkyIbOT7oUa9PcJwuz4n2aWs4sUkx/ZqIuvwc5IL4MBmXlAaxDOh7C
 sSMMoMPGW5uro98wvc5C1LN23BxICMepRr9eBKZyIV/YPZ/CipRjwgpWgli1dMh1eOea/XOyhhG
 +5k0OXLwlcJOtQnxxUf4+tpOXGpqD82aGZ84xJBbP2x8PL+IGRbTObQa8w+cbgUJeM6PhdZPwYp
 hWx0PeHeNiRDChCQE7mXCRVXOqPxbtTjCsHprcAub28sPqrlyp9UkRh39oLUS4dIxhlkX7sX9Gq
 DZNCEhigz48OoAA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Changes in v7:
- Aligns legacy CSIPHY reg declaration size to standalone size - Loic
- Drops previously merged patches camcc - Bjorn
- Subtracts newlines in dtsi - Konrad
- Uses suggested port names and enablements in dts - Konrad
- Implements latest CSIPHY changes in dts - dtbs_checker + csiphy driver
  reviews
- Retains cphy_rx_src yaml requires it and is benign in the dtsi
  declaration - Wengmeng
- Depends-on: https://lore.kernel.org/r/20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org
- Link to v6: https://patch.msgid.link/20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org

Changes in v6:
- data-lanes start at 1 instead of 0 in the CAMSS node, aligned with PHY - Nihal
- Link to v5: https://patch.msgid.link/20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org

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
Bryan O'Donoghue (12):
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      dt-bindings: media: qcom,x1e80100-camss: Make vdd-csiphy supplies optional
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
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 520 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 112 +++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  67 +++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 142 ++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 141 ++++++
 6 files changed, 1001 insertions(+), 9 deletions(-)
---
base-commit: 37dc35244bd8c6be6d79a6ac591d14c660822dd1
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

