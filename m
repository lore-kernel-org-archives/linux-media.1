Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324409;
	b=5P1aRZo/eO7nW8timB43m7rFFTEadlvNFDOF+TTlBMNyehlMa79WS2aVdeBoouvtXRe7
	 TwNrLRpbGrh1Ugs7uc/IBaJxKH9hiLP7AZP8DoiA3t6aHgdSCA1AktvbZEwQ2X5MScSf+
	 iRez6oat8gnNnZY51ZwZ1+8NdsFNUmrsvp+0UB6Py1nzUUOZKi98kgTrRCKpJXL3cUXq8
	 BhZodi0Ny8ezGt43RPGlHNdAEvcDenCt4r4tfQY/ApPcuMbfpdZADy9iN6ov4LAdhuchT
	 szsN8lCSn/oDpLYmUn4xo6ovvQ/pNJjmPyn0I57xnRKdrbbTKGjOB5vYYEUT6yAhuvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324409;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=D3FHZwdzbc+DzBCXcwAt60rvyFF9oaH2jUzt7UMfw8Q=;
	b=OxnhTGUF1v3GrEzUulqL7yHryBUE1s17OIJ6WlSxlMkcXWsYiJF/E03V74tk3pABdLKW
	 6rTfET+2ECH87hU4oPKGQB79Z7xaWvmeSv0EBr6F4JwB6PQyDSfd6RGhoHDhJf89sMllt
	 4upLXiM8+NptvB1icndDiJ4YF7P9jafeKArZ2PPn8lq6XV0Obvp2yekNV4b5P/VODNs64
	 78Syyl2XF7IOa4tNvGRZGFdSYANoO6itOK+t4B6y0XoeiHE5w9uYpo5Q+oVo0WoVmRixv
	 okYMrjlvmL77fjNo5uIWVsj0iKYd56c1Cl91jyyXsQklicpN+q4g+MwBmp8bCi6zskA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxiBqSJh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7BD606A33D;
	Sun, 22 Nov 2026 05:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TxiBqSJh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324408;
	b=SbALYnEakLPz5otuk1mj8aveGXfL6zj7/TF7pQSbuFWsQAoJpgnXLiZlT2fTD2i1dzVO
	 I6L2KvHz6NgDqThJr1uqWtXISGQ3dwalD5msA9XRDN8+hfgArdkMXWgWLFebPpYFakBWi
	 /PuPlKdEKqJJpi5ZAcAbdzImTRzBmAAmUIa2ZMj2XGjTacpw+zT3IlLqCCR2nYIgq8Y0f
	 uunxSo/HNSib8P0DLOcVdpSs9wjvHg7Vv1uiuFW/SqhPzf9oRE496Mhzznr6WDonm7tF+
	 CJ16/Kjtd/KmJyW8Hy92hN78eY2RXhHRb1+UaoFj/G+LPrYD0JcPIaKd19sOW9BuXUQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324408;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=D3FHZwdzbc+DzBCXcwAt60rvyFF9oaH2jUzt7UMfw8Q=;
	b=ZHIlr8hqcRP+VjCTr2Kl45jMdhYJMrRdSIqMflxXIUhB+SB3SLgNtMXcH5t/x0UEXons
	 b3yERJjUbqjTArSXZ93T+/uvrHzR5HfQu6urwUiDg0vWTVGBPAeJ3fJopA/HJZjcOQHwn
	 okeSylJojWdA907gIArvxggOl9wE1mfE7r2XRZn+zoRvmJe00O94dxsfaTuIyrlv0g+vv
	 Odf5xGB09M43uWazPNsyuejpYN9r5cfWT+BilPas6wRgqnsZI/vaBMVpZugA7D0V3Ui19
	 y8nPWo752zorjgikMYyDjYNE8Dl2xz2KZD03l/pvz08LjFW/uER6D0fFKZriW6h3JKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 006131F000C6;
	Sun, 22 Nov 2026 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324408;
	bh=D3FHZwdzbc+DzBCXcwAt60rvyFF9oaH2jUzt7UMfw8Q=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=TxiBqSJhH55ZWnrZF2Vh00jz3ZZMzoPU2dLMR+ZVKJYQt1rh0bPv8RLpM7LGo533j
	 CmmLf3hhQ02b9/4BY9Yi+QkIhQXAoX6hhcEol633KPuOg67ukTKyxMKRKsKMCYAmsM
	 Wfz/H81KIDXDeII3rk3yDbu4BSj5dn6ihn1lQ6mLhm57oN0VzvSeCk/v9kUzJyniJg
	 2ZAIgftGc7S9H8Q1Ms62O+TcOcvEvBlc2oetvH6HKkqs+XUsyiiUA+cAsYwIXI4wLZ
	 1u+RfvW6o5thIFTDMnG3svtadHM1W/K27G47kETblWuw8R8VoJ2XNIKQthz8MO13Dm
	 BIvor3Sd1kMpw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 83C574BF37;
	Sun, 22 Nov 2026 05:13:27 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Subject: [PATCH 0/3] media: qcom: camss: Interconnect votes for SDM845
Date: Sun, 22 Nov 2026 05:13:23 +0000
Message-Id: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
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
X-B4-Tracking: v=1; b=H4sIAPN5AmsC/yXMwQ6CMBAE0F8he3bV1irEXzEc2u0qa0IlXSUkh
 H+31eObzMwKyllY4dqskHkWlVcqMLsGaPDpwSixGOzRXoyxFoND8qMqahw7d0YhQhMdxY5OTKa
 Fspwy32X5vd76v/UTnkzvelUbwStjyD7RUKPKw9zuHWaysG1f+uk2bZcAAAA=
X-Change-ID: 20261122-b4-camss-sdm845-icc-1d4cd8c3ec17
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324405; l=1830;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=0eKhIZ+ChtKI73qyKB4ZI4olHiQz7Q9wrSL2FmVT5UU=;
 b=/jIJzyp9G4JmqAhPZ393/BkZFtZPUci/21USxarhIHV2aEb6kzwHmXVbg00OrikYxV7dz66z1
 J83cxfN9EFyAwqbrmz/kcDcguCUvsJlSZWfb678acfiVWdgKqWzV/qv
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io

CAMSS on SDM845 declares no interconnect paths, so it never votes for
memory bandwidth and runs on whatever the display happens to hold. With
the display off, capture stalls: on a OnePlus 6T, 8 of 10 1080p
captures stopped after 0-1 frames, against 10 of 10 complete with the
display on.

Patch 1 allows the four paths in the binding, patch 2 gives the driver
a bandwidth table for SDM845, and patch 3 adds the paths to sdm845.dtsi.

Patches 1 and 2 are for the media tree and patch 3 for the Qualcomm
tree. The driver gets a NULL path, and so no votes, from a device tree
without the paths, so patch 2 is safe on its own; patch 3 needs patch
1 for dtbs_check.

Tested on the phone with the postmarketOS sdm845 kernel (6.18): with
the display off, 10 of 10 1080p captures of 100 frames complete, and
the camnoc HF ports vote while streaming and not when idle. On
v7.4-rc2, dt_binding_check and dtbs_check are clean and camss builds
with W=1 and no warnings.

The same three commits also ran on v7.4-rc3: with the display off, 10
of 10 captures of 100 frames, no camss errors, and the camss bandwidth
requests go from zero to non-zero while streaming and back to zero
after.

---
EMCP333 (3):
      dt-bindings: media: qcom,sdm845-camss: Add interconnects
      media: qcom: camss: Vote interconnect bandwidth on SDM845
      arm64: dts: qcom: sdm845: Add CAMSS interconnects

 .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 10 +++++++++
 drivers/media/platform/qcom/camss/camss.c          | 26 ++++++++++++++++++++++
 3 files changed, 56 insertions(+)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-camss-sdm845-icc-1d4cd8c3ec17

Best regards,
--  
EMCP333 <emcp@enser.io>


