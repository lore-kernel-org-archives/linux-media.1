Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789656;
	b=cnks1OUJYHi6CxSFatT8MlsTxLVTCsaK2KTD8UZIQVtzONtQ/J/jbvLpogfO2Gxu+3A/
	 9JAj5NlVmBcRxd/tLyYbhSMpwtpw6l6FIdzSmJ4eJTTgRo98iCOcO91eyeOH/dSYAr+Xn
	 bHviAGo2pM9VlrJbHbtq+2KF1AaxC6XoYAw5W9ktGaNsyHWQweTMHLZ8P5d+7y3HIRm6z
	 QKbxztJyZewP5D1lxY/C0amTALMb/TGeDge/IQFQCk/P9Se/GfkDraxJlpPNLYM1TA3er
	 5GHZTqBfLXSuUI3n+WZ51LW2478ZDxYxyO3+kh2wQWAJxs+CwlFZ3AjiC/3K4DZMkpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789656;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=EP0ZFC3B0+0Ukt3bbF35U5DSCSSmVgEWZGY3fHgO9Hc=;
	b=oSr4wNBC1guLpL0SGRZTmgRg8Fy2DWBIMqqalSq/LBph4s0OCKvBjLMhugTnY5n8NWSr
	 YA2Nt/rz/oPlO4gRSgY3SHfvtrKxjzXt5b3vXNGakOqzU8pfCKLuy3uq4RTtRbOoNVw1b
	 UIl5f5bi0Q8AKu3fGo0wgfRPLi7bSpKtIYO5pLSlXEmnpqCHOspoBuDWmZsGlqfJ4cm8t
	 +j9QdTyjAybfTm1lqkqh6YSy4P94f8DWi/BbR81dXCQmJp1H8TbcjiJgBnsQyS8nqmtK/
	 tKNGCXJD50drHSsb3VbazVUBL+oEgs1xHcY4ONYug66SlJ/+sLQoXty3ub7+T2XR9Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rs05kzkl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C36A606B1B5;
	Fri, 27 Nov 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rs05kzkl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDC01F00A26;
	Fri, 27 Nov 2026 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789655;
	bh=EP0ZFC3B0+0Ukt3bbF35U5DSCSSmVgEWZGY3fHgO9Hc=;
	h=From:Subject:Date:To:Cc;
	b=Rs05kzklQHUkqPnHvuUNyRG8NVT1a/mmvuHQHg26/M3bQ3GOQC1pSfV2drh0alSBO
	 PJoE4Er9qjWsbBPsDv3zJlldfhQcFT/ujKEh0RXjrsHDAhlAQvrwNi+OlhsHAyMUeU
	 1HObtM7APW9FOS6pT/D4UWfMHduGG3N4oznEkKftNbD847D+2Vxz04To4IqfF0xqU2
	 4kwUBUEmaWQcYudc/BrX7rVWgKXLLGkLe4dDsCw880cspmFejDJsNXIhKWpoNJLZyZ
	 n/T5qoSWWHsbf9HAZ8sUBLZs96sWPCu7zuDp3TTSb65jICpw19DmAzP3DTQb8TytHB
	 OlHDkr/0c4SZw==
From: bod@kernel.org
Subject: [PATCH v8 00/10] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Fri, 27 Nov 2026 15:27:19 +0100
Message-Id: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQyWrDMBAG4FcJOldF22jJqe9RetAaC1o7SMEkB
 L975VzsYuwe/4H5ZnmiGkuOFZ1PT1TimGse+hb02wn5zvaXiHNoGTHCJGFM4juN2NufWrGvmeF
 r98DhVjMG5jV4EkSwGrXua4kp31/y51fLXa63oTxeg0Y6V/83R4oJTjypEJJLWpiP79zbMrwP5
 YJmdGQLxOkBxBqkwTTLAihDNhBfQUcb8QbRANZwIimVdgOJBVJE70OiQaAYF9oG6tgWggUyROx
 D0KDgNQ0aHBgTNpBcQwenyQYRqRKL3gvJtz9SK4iqfUjNP7KSR8dBc+3+QNM0/QJ+XzNndQIAA
 A==
X-Change-ID: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Lloyd Hazlett <lloyd.hazlett@gmail.com>, 
 Liviu Nicoara <lnicoara@thinkoid.org>, Daniel J Blueman <daniel@quora.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5220; i=bod@kernel.org;
 h=from:subject:message-id; bh=0/09UvDGzKBlq2a1sovIPNkTwH3MyVS6ZweK8NZRiGM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCZNLJZyKyfOJcaZ6Xp9quIz8u61o6w48rnvqo
 g/bXlX4DFKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawmTSwAKCRAicTuzoY3I
 OvRVEACpC3flhyGuGuAZOZ+edKB7jvFNdccE9GwoeG+TcMp3IaW7mBRWZUY0mzBse2gERWmGb9G
 bvfG81XRudPTujq1cTqIIMmIxcJ1s26ei3HkiXCvfbowS0QznBwF7qewdiRwXrIuO6DIqIWX9bJ
 5jbQMk+4HUl6kpirIqwItvhu3gfn0wVLFDxQbtE2OejXGxlND3Uc98NMhRzLaMt9mYUnB1LAYTD
 AKY0URcCofV7azBzE5mRFnRqCXy0HNMy7X0rZMBAre9ODztmYf4QPuSAJ5JrSp6UczFUyIgCEk/
 Mmx3NM9D7AKAurFWrADKEXGeJSOz9FIjQqd7KmwpEsbVgBFYt/zIW46/T4LR9sZDlgL2mYJnmXO
 DykjvXiN4R0xAyj+qRmwW8QnmB9kLK7zUdRDYi+xEIYMAbSzGx6YQQ7LKc5Ox9+dhqzb3Dr5vuy
 pcUUbbNVkLv9Na0d/+hx0tpWfRynl3G5XGQ97ol7MSWH3hopsV/MmfzUOIFYPz6bfC+h2MV8PH8
 xQoQJbrsOzaUaU1I4v8p5wS+65tRHAeiR/YRwY+CShGtAjf+7dT3JNH+W5Tes8ODxdyu7ZA/7GJ
 Ah1EnZOITb66AZxQQL8fGYYGaTQz0ZyBSwRtYyNad1U9hG7CLwkAN7truZNea7Jdl+e0krQIHVH
 NMaZ99XAjkmiWyg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Changes in v8:
- Rebase no changes. Resending @ request of Wengmeng in Qcom - bod
- Accumulates Tested-by: from community members
- Link to v7: https://patch.msgid.link/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org

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
Bryan O'Donoghue (10):
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

 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 520 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 112 +++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  67 +++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 142 ++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 141 ++++++
 5 files changed, 982 insertions(+)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
--  
Bryan O'Donoghue <bod@kernel.org>

