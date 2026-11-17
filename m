Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928890;
	b=p01Noo7ZuIO2C8Djj86k4bYLuctTqWjFEsKrtGlG5sDfQQt5BZOmvAkjBRopyoYhuJZs
	 MWCazm+QigcYKH7dg5yfJ5HmMq3W6bPxV55XYyIF2QbLSaictX2t4jNHiNpClb6KEUeCI
	 DDbULy9qH20Mh2eamVW0vnfAJX0TWa5xehPgn0lfhlcdLtyO1UpK7Df+CiUDjeSH5aFfu
	 +/ZMhKOFLLA87Esy70us9rjvr5diUTgFKZz1pAzKZ+lVZABy7mBctF1GW35DdAZZccAEo
	 KlvUFiDprUU/YsHDOKnpZTlUjo2sPjFDImq3HH8URIiA4wwflWqSpi3N4iWwIsyWacA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=StzyxbSuvXPXmgG5QlRp9NABTSBhGgsMMch9p0nc8yQ=;
	b=iIok477HfF9xyFRH21Ij2gwnoTwqXmRXEH1v3ZgMSbRtmI/e+8BHXeScJuqFWWhKtQjo
	 dv1sjP2QUWgoJ1ntrMpTGwkig03owGRuFf419jI0zluSGbIRayTdQ0Z51tVv0DG7L+nZL
	 AAM4pv6P5GTDRMaNp5es2FFh9HR+mWZ2lHdF+AAoQOCj/yS1H2CbmdxM6By1kyy7B51hy
	 P5Nuo2nwy9H4Lmj40M8MnoqME9bOcZVwewHWwGnFeq/AN/2uWFMnTQCNFQTFm32nae4Hz
	 u3LM3as1M1qeJM0l/oJVR8v2g1Cp2sEcdZwxEpqxulQ97yi+VhNSPgJPN3s5p5yfoEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqdFJ3Uk;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C101F606A32C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 15:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C101F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pqdFJ3Uk
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49465892f7bso3875173f8f.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794928888; x=1795533688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=StzyxbSuvXPXmgG5QlRp9NABTSBhGgsMMch9p0nc8yQ=;
        b=pqdFJ3Uk1SX6oEcpPN6XKmXl23PTDknFtxHdAPh6fjtLqPhYPRz/lsl9cseFAmGWQN
         HDY/2IKNupPpk118cODK2WQRIQEbMQ/uhNgsE+GoR16dLWWF7hzsp1oGzexGJKyVtVbh
         uQST/jsPZ2l+N+uQukz1E6t05djfsTRFt21N5q+DGByneh03jZBAcpO/D2VIfzETadLy
         P/AmYNKet/S6JIbFHRR2zymfGjAhH2495PNYbSkLXVOe+licujHcZjkuI4ip6od9ijcx
         PYfI+IqHA83Dy9rhZ6Kc8pJGmnAYLrWHIk732IE3/pTgPWogaq+krtFT17NTXyisTLgj
         Haag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928888; x=1795533688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=StzyxbSuvXPXmgG5QlRp9NABTSBhGgsMMch9p0nc8yQ=;
        b=OD5FdGLxRnbDPaLBe6Hu5NyCSmpAZv66aA+QAfifs3jZshjhLF5OPTd4dzRnhBXmZt
         KYv+SU/2dGPrZROs4F2iRS5PcLFzwXqdPnqAhpPj8tzrFYfos4j9cOEobS5SwAFCdXNT
         WnuXrcIrdQwONK/TZ6KkJN/KegGT0vIt350ARurp3tEj0mckwOxouX0+z8zozXoI9equ
         rEn8RghNkA3gmXPgyQqMs2eaz9ZsfT7FIzUZZB5V5lSQSqyjCqOGuz3ZyouR6EZmkmkS
         V1zOen/GvHJYJym/XYQh+VOfQrzKMRR9qZ3ya/Lt+x3phUtzE5Mo+51wcHpLf1XJnEGa
         80yw==
X-Gm-Message-State: APuU4Z9tXiuqRzoBPcC0K3NpgVGAQ7VhUkNvLWpArR/PelBEc7O9wtY1
	eGo1wN+b11b49Y7L35iDsh104P2tlkoJc/WOOPVOsbfr77RO483Aq8eivThY7U9FxZo=
X-Gm-Gg: AZFdTZcEVItfnhQK29/Mn5A5Z+bUGY3A9rnVc8SOMcPZcmjHKeEQau0+o6vIFSCvK8t
	6GDd45vmz1n7/mJhJqtthRx+FS769S+9bJAukRPsYM13VtbSHPeUxZcEDyQWGUimqU3vsy+d5Ti
	SxXG3DHQW8f/eF+fUynfLOi1SbAPnxWnC1G2hiJL5FPa690eAv1A7Bx46ZKnsPmbz7wwZdyc6IF
	iv2QAlCWlHbCpsynJQjoGZf9hZRaymX1JtixIUhFA//p1JSU6fhamfdgHUO+BzqhhNV1swcN0hk
	xfknPrF0i+ubLqiv/vuvY1SpiHAopPhzgAIEvJbsqU4wtW+/cwwnz/+VruhE3gkTs3y70qcA8wT
	fF4SH71t4jYO0cmaovB9aoR4UU65GBovKyCbV4HH1HhBv3I+vLvqzAEcJt9MNGB4BxDk7r6ggzu
	seclOjHiBbP+LM4unNWJbQ3roJU9nfNa1fwvtco4frSskL5idInJuLHgJaP/O0z4YfSM4B1R5AI
	AJepor5Rz+yb79JULDK7p97dgevEKkp9wMqePZCAl37ePr5yO5PrRVf1qa+VJKENO8HJJBU9f//
	1xYd1tcXEyErZbzbUK+z743zgf8tvv9PIPQprTiN5CMAp/sn43ZTDAh5/dEzpyLrCYkhbaU=
X-Received: by 2002:a5d:584b:0:b0:491:f34b:49b4 with SMTP id ffacd0b85a97d-49c729bb9ffmr29483716f8f.44.1794928887864;
        Tue, 17 Nov 2026 07:21:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm26703133f8f.41.2026.11.17.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:21:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] media: qcom: iris: gen2 encoder picture type
 subscription and operating rate fixups
Date: Tue, 17 Nov 2026 16:21:22 +0100
Message-Id: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAPJw/GoC/yXMwQrCQAyE4VcpORswFbfoq4gHzU41HnZLUkUof
 XdXPX4M/ywUcEPQsVvI8bKwWhpk05HeL+UGttxM/bZPIjLwXCdTNrdgFK0ZzqO9EXwYZacJOqR
 9ppZPjt/Q6tP573heH9D5+0fr+gG/SPSzfAAAAA==
X-Change-ID: 20261117-topic-iris-encoder-fixes-9f13c6ec765d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=X76j2RucB9cYIefazEt219GMg4ALlbHtbzud5a9f9ug=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq/HD1FMEJkw6TckTiCSiRBUN7om6ote0WXmWZQJS+
 ytilHGiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavxw9QAKCRB33NvayMhJ0Z2FD/
 4wEUMRwSs/QnnUn5l9pDPrKiL6NmtM4GOTCzM2Kk7Iy5sfVTeu+0H1mB5NOid9pR9mSvHLxjOdVALw
 bREFPKD16S1vfORRZ3fJJaLgoao9Bcr/DHhc/QtjkS6Gya2/xkkyBZvQ6jW23K7dubJrCdYzviIBrf
 Z2KwE5fnYbBe+8/+puPnZ1JjVrefx3CBBh5SR1/wn56pSwID3vQXvJBIshsBHt9JaAyFqHVDOAHftE
 fxtkbyIiA3fqKEnNHhcfIQZ4kYM1nVLogTscEdkQFywmq7Trykvazk0JKEL6H/MG2/df4VMGLdSq18
 vT/AL7sCfYntzGVFZ3u4rb/iOx5rbvPRWowWSBlq5oxoxlcbX7LyHpqrhGH3GvLgDUnJG7DLqp2yfM
 tZf1wrCQDsbfOn4cPrPQGtTCY5efR1BMVzJ/2Hba+PT4YD/OcGEDkuTnt21kn3ELh5FbIu5nwfEIQk
 8l6K4+i9U/ag7jA7Tkzw1dewr0DvNqwJKzlJzEvZvwnK/vbEwKGz0qw5kp0GMPhWhFCQUOtYIuFj33
 ORcXs+FFkZ3TqEAuFs2xWWbLaZaYiOG7ezhCcHtpxjZC6hdz+ucwZDhR3vzea94gybeGSR6kKM93i/
 Xb/C6zO2H61yLSxKI29wbOOTnBwjMDpCoricn869+rW2cMMz6ieiGMT5abpg==
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
Neil Armstrong (2):
      media: qcom: iris: gen2: subscribe to the picture type on the encoder instance
      media: qcom: iris: venc: drop operating rate to match spec

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 23 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 ++++--
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 -
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++-
 .../media/platform/qcom/iris/iris_platform_milos.h |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 -
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 -
 drivers/media/platform/qcom/iris/iris_utils.c      |  8 ++--
 drivers/media/platform/qcom/iris/iris_venc.c       | 53 ++++++----------------
 11 files changed, 56 insertions(+), 56 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261117-topic-iris-encoder-fixes-9f13c6ec765d

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

