Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267730;
	b=TofKCYprOi+tGeMhdd9hbL2nJ0nhpimt/nWCJA5FOXv0+LCExhCTST3NXTkrHDGaa6nD
	 Tbm/vocKkRMXVVpcTcGlhfMWMM4r//dU/1RoFtKsk/1OjsSS3f/n33rWr/ucLthCDqBHu
	 U3PyWlfDnXneRCG/mhE8iYFICNWhuQ/nGU5irG5yf8M8GkokkXsg73uXcLboNy9LyS7B5
	 IfVug2TLHYCaUEOX/iX58CJ0pIc0fgFaqSBRxSRd6uZZuVMi6htaVe+6s+BPGWy92kAzT
	 org6HPR794UlT35T87lxeR3zhq5qi8i1huORqZO4LPEikAxmZ66Tdj3irC1GNCHWLQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=naLAUZdz6s6FNp3zuqC/8ffp+u+vsG77MVvqVcrjHjc=;
	b=1UGc9RgCe0wnPJJkMHsdD1vaLbOR/44pdqaQi2iWYq7A+FMMk+UDMoITz+r8Zf63OCrH
	 r0MXAKm/GErNmbBsNyLwoE46TzSwHM+ACz5cu+YelgFUuACP44llQajAZdYEvep1e2nka
	 Mlm5CB3uTvyJ6Lf3e1lJ6Yoc/lyLEYhQ4DvGV/YVt4Mn6eIZAo0CxwN9mtdFsXVE77OUJ
	 4BGrao/GJt7HZGAP2oJTFdh9q4m/SfjWVagfcriMaUrSCk+flytBwZ0OISbyFCzFuid1p
	 3pp3YJLFfwk71Z3IlLryOjMjUSd/x3jdIlVog/x2knyRh/W2oYufMZGQB/aHWB3xITw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xz7wHT0S;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C03606A33D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C03606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xz7wHT0S
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6945515e9.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267728; x=1793872528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=naLAUZdz6s6FNp3zuqC/8ffp+u+vsG77MVvqVcrjHjc=;
        b=Xz7wHT0SGii8DazmZR+je2sKds7h1ZfGX5NWILbzHQGDD0eCHT9oCxUET9EkWMu1kP
         t9aCni+F7WnELj8vypoHIYxFBmBuntkFYc8B+4n5snSfJxvUE8ueQq0iAz/JvG6aEqB2
         R771CrHz++C75ArY1cx997Tq5GhwAL7wnS2xjQ25iikWt5J1l4mr7Q1kfmTV1MI5O5iI
         EjerPsYl7gz6NPMBvPnw8MsZbok/j35dFifT5uJGio2YNGiS8fAK5qSt1d/ZMlW5UkYC
         fekL8YkWdAvgOwAVx3P6uCBl4DB+TcqHX/3UEn3HYe/1vbq4sVcx6OfIuyQdUHWBYzDH
         efLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267728; x=1793872528;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=naLAUZdz6s6FNp3zuqC/8ffp+u+vsG77MVvqVcrjHjc=;
        b=L2gTmbGBXcngL//DNpoFjHIi1msliFp09YmNK6kifry6/xBfvOJYO9sC6hwv4lZ/FU
         MmmMLQ5vq8SwBmjiCxgme32SnnnuPhKFuEhIIeo4m8IuhR8KFTdTsZr6AHa4wzIXBvms
         HLauw+3B2O4FNQXTN0Dpq5Y4NjQn6M/TCLh0wkiWhm7C8Kl7xSynSekphM7Nv9A/qG4e
         K1V32dgCN/Du1/GyADVIojXPPBzKBB64izjrWKXd8lzbkipgVdP+BRPj5Q9pokMKAlks
         XmRtz2hBo4nm4u0gNXzFRD6x4VQUScPGoeoM8Y6xLpHdaBEXfsudbVH553ATKJP66Tco
         t76g==
X-Gm-Message-State: AFq9FYKELXeCSi2g0QkluJGxrQ/LixipeC6GIVCjsc3deIMVjLpeCADF
	gvS8R1GBMYep/KZxKhhX5NAzhOfquGWsLLOnpRXQr7JUAQuVkyJ5G3xbkL/QiFylzqc=
X-Gm-Gg: AYBFou2q9F4u6g0x7ElYx2xbY4Jlxebk8Sgtxe43BHpd2RAEMO2CFrJO7BlD7UlUubo
	CwEdCv5PIztD+Bc2ZIkt2yE91ZoZUsS1C4rZDcrBKs2hIJmLxtnvrAYOrx6WvaD3rRiz1zHXVzM
	7EPThmJ1weI8hCNMjorDbtBngUe7Ki1gGhNjdLbSxn+KQzF1Jjf8VsKySQmcqmUYKzV43MR7Z0i
	wq2gEAxs+guy1wUwdj73kIQ0WqgS69A6qcHxd6t0XQ2Ir4IpCIZif7euIIXiwAb3SrtU4InoVuc
	3nAmPS/moAM1dsKbp9JL17+GbikJs0TTq2ZS7iuFH5ckCJYq06KmDKlcV/9G3TKRSJ6hRDWZt6F
	Dseh56yXxb4g0uwlig2/msyYvQHx9U1789lSuM92A9Z3yFXCSrIwWonlb8ImApFNOnlNNw/1WW1
	oT3YWm0Hh3zuGLWpeLatsSZE/vrGrPunLhKzhb0KErzDsBZpKdNiKwBA8/cmJA9AbERJSEbGX2+
	NQlOn5lvqvBJbGy0VQ5MXBmlp0oxNt9aGnUh76qmnT1x8pF88rXvPnXSYmuAr8uqYbrxtdvCZtl
	NDf82KzDQ56sMij0jHE=
X-Received: by 2002:a05:600c:3e15:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4aa871e8bc9mr57343495e9.6.1793267728239;
        Thu, 29 Oct 2026 02:55:28 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:27 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH 00/14] Add SOF/EOF sequence logic
Date: Thu, 29 Oct 2026 09:55:09 +0000
Message-Id: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IQQJ6FekiiZM6orFkNLSId
 29al2/x/wlCiUmgr05IlFl4iwVNXYGfbHwS8lgMWmnTKN1hbheNIdmVUD7RoxpNcF1rnSEDpXo
 lCvz+H4fHbTncTH7/beC6vsgSxBpzAAAA
X-Change-ID: 20261029-v4l2-frame-sync-0d6fb94ab6e6
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4934; i=bod@kernel.org;
 h=from:subject:message-id; bh=ERAGHeKcKTbTc2nwUmjgdvPde825r6Ru7VRRGqkmXO4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgIzz77L3p8baLvrMnKymCo4QfC63skCfKD8
 pkmEH+pq4GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCAAKCRAicTuzoY3I
 OjJYD/sEilC8/4jXKn5ElhLkge4dpZ7nLmEw907+3qCbaJIhTrW95WY17fXhdSiYQ9Ks+42kHXo
 TeXoCFkw7k+DBkqeCI1GjAt3ramOyt+L5h46GXxAPvJd7CQaGMf1pbFbKjAXxUAW+NkrrpICQNk
 v29wXolkP1vyrFK8y7i9uzOSrh/pwpEZ5CnZCcN0RnVmZ72ttWks+vhfolKixV5x02yN6xWZyLR
 G7Oh+g6y22xiffez/sJguj60PXDyr+RWYRsMr0FUVUj6ToE7TkgznOnYa2UZzXSiamCJn8ZTFWg
 JxmbyRVep2ViXkpr/9eoTl8b43U7D94o8KYSIw7mNm9bxpz9xykd3bFDKku4vVrCZ0tFNuxN1N5
 fkrW2qnWmJO1xVKYL1U/STWBUlpHD88nfw8dnZChhNpTd5RgI6yGroAA2wr/7r2sVPwGJFBnPsl
 Hj2DNNvjKR13jc8T1pVQ9i3Wlw5b5fpsy/yRCXPoKOSz3t2GKQzz+GX2fPDm/jHSijfzRTSzlqc
 KY5ujp7Cf2bUapNYSmY4RXk/YxuNkxg2Fz/9FF3EXUP3fX5SmYWhzdp2lmT4FwcnNCHXjXSCkRu
 BPL3p5BldvXPL5jyfietJ95yIFoBDLyjAmTN/dvENO7s3TDJ8jJde665RzG5lxk/o8WMtqLk6hk
 DeNJ5/vFx6aKUNg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

This series enables SOF AND EOF event tracking making use of both events.
Whilst the code is actually very simple the functionality we want to build
off of that simple code is not.

- SOF
  Serves two functions. Firstly. Informing user-space of CSID SOF events.
  Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
  User-space wants to capture this trigger because it allows user-space to
  better align the time a frame begins to events elsewhere such as IMU
  event timestamps.

  That functionality is directly applicable in this series.

  However we will also build on the SOF event in later patches to allow us
  to begin programming of shadow-registers for the next camera frame.

  When the EOF event happens, we switch from one shadow bank to the next.
  This is only possible if you have the SOF event.

  So SOF serves the immediate purpose of timestamp alignment in user-space
  as well as the 'evil plan' to trigger off of it programming camera
  parameters for the next frame.

- EOF
  EOF even on its own is useful because it allows us to increment
  vb.sequence for each frame as per the spec not just when we have
  buffer-data.

There is another purpose to having an SOF and EOF event with sequence
numbers and that is.

User-space submits a parameters buffer. Kernel accepts that parameters
buffer but can make no guarantee about _when_ the entire buffer will be
applied.

So when kernel finishes application of the entire params sequence the
returned buffer contains the sequence number - from the EOF tracking which
informs user-space _which_ frame vb.sequence its given params buffer was
applied.

Similarly when kernel produces a statistics buffer that buffer will have a
sequence number - and that sequence number will align to the frame sequence
number that the statistics describe.

Thus SOF/EOF tracking is fundamental to passing parameters, returning
statistics to user-space and for the IPA algorithm in user-space to
understand which stats, params and frames are related.

The first patch in the series addresses a corner-case when a quiescent
system can take quite a while to wake from idle, too long in fact such that
the SOF event is effectively missed.

On 'normal' systems doing lots of things, this is not a problem we would
see however on my test X1-CRD system running from ramdisk - there's
basically nothing else happening and the wake-time becomes apparent.

This is not strictly speaking a bugfix since right now nothing in CAMSS
cares about SOF or EOF so if we take an additional 2.5 ms to process a
data-buffer on a fully quiescent system, that's not the end of the world.

OTOH as soon as you start to care about SOF/EOF then missing those events
is no bueno.

The CPU latency value chosen is 100% stolen from IPU7 which seems like a
good starting point - the stealing obviously - and happens to also work.

This series is really an enabling series for more work to come but even on
its own is an improvement on the current situation.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (14):
      media: qcom: camss: Introduce CPU latency QoS during streaming
      media: qcom: camss: vfe: Add eof_seq to vfe_line
      media: qcom: camss: Introduce SOF sequence tracking
      media: qcom: camss: Introduce EOF sequence tracking
      media: qcom: camss: csid-gen3: Enable RDI SOF driving
      media: qcom: camss: csid-gen3: Enable RDI EOF tracking
      media: qcom: camss: csid-680: Enable RDI SOF tracking
      media: qcom: camss: csid-680: Enable RDI EOF tracking
      media: qcom: camss: csid-gen2: Enable RDI SOF tracking
      media: qcom: camss: csid-gen2: Enable RDI EOF tracking
      media: qcom: camss: Switch on frame_sync_en logic for sm8650
      media: qcom: camss: Switch on frame_sync_en for x1e/x2e
      media: qcom: camss: Switch on frame_sync_en for sm8250
      media: qcom: camss: Switch on frame_sync_en for sdm845

 drivers/media/platform/qcom/camss/camss-csid-680.c | 21 ++++++
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 19 ++++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 31 +++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 74 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 31 +++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss-video.c    |  4 ++
 drivers/media/platform/qcom/camss/camss.c          | 44 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |  7 ++
 11 files changed, 243 insertions(+), 3 deletions(-)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6

Best regards,
--  
---
bod

