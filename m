Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601587;
	b=ov+Ecl1boXJkI9L+ASQ9nv8XOCRsAwJfGTdNheWejj5Vpp6J1mDY2l565SLvnahxxbe1
	 gGFc6D4hIk+rZuPLLmtONlWpVgh6cz9J9xCygZA2aSQodkNcN/pXE5Pl5KvfEmnmBE3XS
	 7Aw2XJ+J0H3Clzxa4HlQm8Uioq+FbOM+qKW8ItYKEsY2LObcip1c3gRJghMdqCObSBadZ
	 GBzc3ZgwHy35z0oCWVJTVEa+C5uE8QMHwA7CFUUkuCRtAZ59YA0v3FaNgqDc8WfGbgy4s
	 82wFcQsEXXJBBq/UNw0+obagL/KN6wKQ6/c2yz7AmRlPN+IBqWZP6bwuuTDiTQ1FIoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bpxsMEzQShqs/OoZ3bJC6L7ApSx4vfpGRnQ+ugNkeyg=;
	b=RAQRMD1+9oUfR+TmCTl6CX3IwpLs7oJ560jTEJZpObZBeWLOK0GpFZ3RYOLc81QBfpn0
	 JLfbO0lsutsUWvzPlCGV1dieozihh2PCeS4bLuXjq5VdNSzTfKTlV4WG/Aq9oqUBVTZPY
	 Cb8swuYQ0v/bnFB0/D3uCvL3jMhbsSM7ZODYAiuSZpANFh6/gPdgoR9LtH4xq3UOHqwTj
	 N2xm7Z/gnvBXBHI5ij7bEuiwcka0VQkfzXCTFV1dfBtgvTYHc8ct0CDA2OiyAVkFvQMV7
	 u7vL5myQBSmOEYefY6lzPUUdu+SOOX1PHniiDP1uJP3dufAIx4SlkTAUU5thaqeuxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u4SDCgOJ;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45795606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45795606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u4SDCgOJ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3169332f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795601585; x=1796206385; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bpxsMEzQShqs/OoZ3bJC6L7ApSx4vfpGRnQ+ugNkeyg=;
        b=u4SDCgOJcau7hjh4j9f0aBx8YVW55aRs9h2pu91B41vNDRDRgb0KSlvsDQxUVDk7FV
         kydHD6YOABEAN5cmvFHHIojLOLgsxZjubHOnJVUeWKo25GzbY69NucmqCUpKTTfXCl61
         M7SSkedajAAaqITBoSma9oHQLcI3mb3EdOD3wHLkJvy1Gq0UkStkOyF13ZPkrRXE73s3
         c0ZgNvbg6uzWBlZxasCHwDrP1579YfWQH8ZCxCVnOduMX9HE6OlHfME6IrbglVDTegSj
         nrzOtCWIdr8x92vbCM8aq4FQDweTxQwDPLV0iwgz52cezkmIn25VHMZdJJcB/j+fYC4z
         m29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601585; x=1796206385;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bpxsMEzQShqs/OoZ3bJC6L7ApSx4vfpGRnQ+ugNkeyg=;
        b=NLt/1m4FrvqZ0JaiFcCw4gm3hAAlYub5yCCPs3/O2JOAyI/hwB15RPP8uEkpXU9bIM
         TWUms1IGYn4SBw8rvot6czQ/YBlvzDOsy3bGI5k76/Yyd/C7sw1gVy1xjz+wDasyHHCn
         5lQLVEgiN1zs5sPzstRztxBYhF1KGan2/S4kIBFk9F/BcTV4pSd5QjiBfGFgdLx6AgbA
         HaDcrIPlwE+WWdSbxjgdQpd412HKW1BfbMADdxz05mnEYq5oqoxwHmlWyFC/NIoEeKDP
         Pql4TFM84o1MJj73UMUCM++o2eJZWcgYtniDrITJePkJgNzaP684uPXgrlW/Yy4MOz65
         tetg==
X-Forwarded-Encrypted: i=1; AL+hErEq+BtoRL2iqTXOuocTX4XreV/VLwIyyxWM+HZKaCUxezfy/gkTrj7phVqRy/8KpSgdHB6R5G3FoK6UUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/soVyHQQpYzr56bNysp0BQCBxEi7iHscMjUj2niNbENZDnGsFK
	ZRty1mOSRQntM7pT9yx2wiOWhPJ/Lk1yoeT+WD56h5FJArNCSt1QCCIeo/dYeYmSr/E=
X-Gm-Gg: AZFdTZcJ7xUPaawj/pznuPDcx7WzdwTOM6J/8dEHcBZsuCT7flF1EuS/IlV1fmmIRxI
	K/RBkdT//8JgiVwvePsq33WL9LgGAUGHe4JVtlpgZpwjJ4z3Vdwux6xM+tbb7w5TTJvHzskrylY
	MVCYcFAg0SbRoKWRX6+gAYoWw6jLWaeqa+CDSoSKiPKFrgwggWQdo/oKo2NhznQBMBKVQNoqC7Z
	EmO2QSpIkQXAG235J7JjUaz5mGQJns72LmFbR1VsA/atZVlhpw3ESeMwihXQdxNBv35A47WWclC
	LXCOsxbCVzY8E4JUBHmIG6KqCsg583RYTeXgGMRVnONDqf3KF3euP24lft03Lx1n96qBQ7RpUi4
	gcaoy+x7zAFbRp6+L1+odFDh98EO7f2mSP7pUPolCJlYyV/vNkpLKwlVDidH0xgAatpsAFgT8aw
	7Iwb7Obecr0urH4iDzSYXd/KT3aOxxEwUqdYgBOFc7bjXI44WLV330eF29Ss68Nsl/bbwrzRiWH
	kotMWbPTI+peV4COLgwE7HmGx+KhvhcTtRZGwj9mHVf1wI4qC6hfmWuMVAkyjU5oKybInfZWlEK
	zk2Z4ZTfo0FsT+qEqhkGrhIRCi5bTfuS6ceExb3+cGMqj7yvAQ==
X-Received: by 2002:a05:6000:111:b0:490:71a7:6f51 with SMTP id ffacd0b85a97d-4abb4c7aab0mr25911997f8f.45.1795601585408;
        Wed, 25 Nov 2026 02:13:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm31713382f8f.18.2026.11.25.02.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:13:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] media: qcom: iris: gen2 encoder picture type
 subscription and operating rate fixups
Date: Wed, 25 Nov 2026 11:12:59 +0100
Message-Id: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAKu0BmsC/42NQQ6CMBBFr0K6dgxTY0ldeQ/DAtsBxpiWTCvRE
 O5uwQu4fPn//b+oRMKU1KValNDMiWMooA+VcmMXBgL2hZWutUHEBnKc2AELJ6DgoieBnt+UwPZ
 4coZcY85eFX0S2oNi39ofp9f9QS5ve1tj5JSjfPbvGbfeHzczQg1orCNra4/aX58cOonHKINq1
 3X9AniYQdrTAAAA
X-Change-ID: 20261117-topic-iris-encoder-fixes-9f13c6ec765d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Pf4j53aIKZ8+z0XTljEQ/c9VMxY37xvCoE1SNBL9f9c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrSv0C9QCmMMutsvZFksAZdmyew85JVEm3DIXpBK
 EyxVGDaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa0rwAKCRB33NvayMhJ0ZFHD/
 4x9YzPDVm3i9ZnNJx06Dj/95/zJPUka050DHJEsiFBUzuhrhBGsciEPd3lwDBZbwg0q1IbhkK7FEh/
 m5Bgfsv4N5G4K22TvMtpF1apTAN1Pir//z/edJXcH2ewp7N3RUlg95xD7GKYQwPqn6fnwaGJ4bR+v9
 f3zdXKRxmgd9rscClpvXgoIJAxZd/XN968qtkPgPJgbI2/iP+UsEs1y9X6iOyHhMZ04zELFEwHA+lD
 zGwg7H43CU63BK6JI10DLuc0x6ilOL3TFw+QCapdVZKdIpT/Tn8qxhfValI8YzTLOkdnrdCe3i5zhF
 sp7XXlLNxUyVzUV8ElfAoqbUbBDZbN6Zew/LKObAPkV0ea+az9xdcltmMKpG10joBvGclD2+i5gqnj
 /B3NGktwlzNNneu8H4a8jICyUayryviz/Y+YaE4AQ4T4mV/atKCgnqYdfANDxO7Q+2DtH41QfnCYms
 EMFHiq/ZqJb+LS7fKIZtRoNqBwjBqPKxABaUuSaWD96LkSKOJIyRKddpk0EUdRydD3byTb5UPSyWc9
 pwKkSu8IjswoYN1/1oxWBm3FFJzM7dExl45Go4D2JTec+pqjVLcYqlmhbcCl9+rl7hcwVn0s0B444Y
 0yv1Tu5yDXlcfkL34ocaHhAhwK1LZYtU5jLtpY3ESn92vKq66GkHw6Mc1oSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Two fixups for the Qualcomm iris encoder:

- subscribe to the picture type on the encoder instance

Add encoder input and output property tables (HFI_PROP_NO_OUTPUT on the
input queue, HFI_PROP_PICTURE_TYPE on the output queue) for all gen2
firmware data tables.

- venc: drop operating rate to match spec

Per the V4L2 Stateful Encoder UAPI, the frame interval is set via S_PARAM
on the OUTPUT queue; drop the unused operating_rate so S_PARAM on OUTPUT
sets frame_rate directly, as FFmpeg and GStreamer expect.

Tested on the SM8650 platform for encode using both FFmpeg and
GStreamer, checking that the frame rate is properly applied and the
firmware reports the expected picture types.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add Fixes tags
- Drop V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
- Return -EINVAL on CAPTURE in G_PARM
- Link to v1: https://patch.msgid.link/20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Neil Armstrong (2):
      media: qcom: iris: gen2: subscribe to the picture type on the encoder instance
      media: qcom: iris: venc: drop operating rate to match spec

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 23 +++++++++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 ++++--
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 -
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++-
 .../media/platform/qcom/iris/iris_platform_milos.h |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 -
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 -
 drivers/media/platform/qcom/iris/iris_utils.c      |  8 ++-
 drivers/media/platform/qcom/iris/iris_venc.c       | 58 +++++++---------------
 11 files changed, 60 insertions(+), 57 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261117-topic-iris-encoder-fixes-9f13c6ec765d

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

