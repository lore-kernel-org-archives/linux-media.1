Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067576;
	b=OB4KwnzrFih6KakIQePpkie6PTvYcoXJt7kiiXmCBqb3dB7waEQWZIMwsgSinSo3Qwes
	 py9zo4aszadqw6xpHPtA1WiPbwGpuA2ZXpdbuV0cWyOKSbxp5g4Pl0B/RUbTLAlxKVs8d
	 Pn2gcOPQvMurARTeCZpZcWDKP1mKdzbuyuB4mc+b/Fcl6rYoTZuxRn9+UFp6OYF1BMBwr
	 SeSnsF0ibhG70Im3lkj4ZAsBP+mRaeLjFVK91RI9umKz2OCh9lbFnYhH72mQGem6XolEt
	 gPYKB/Hjiw5TuLdQNzWKU0wK7xswcdh/8QgDF8OBqaBZLuwwoG0hGse/6NWfKkBy7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DHrcVfVURsCK7PM42eHtwMFIpRh89A5AI9d7463hUf4=;
	b=d27GdxGGbgl94umDXhzsSrY20OlyJ4zJymoQDRcsWGnsQdNjGtuT1cAlk1wyIa/Cd5BP
	 l7ERU3/DPKEOQYS3ZLpl1YTXS6jg878g0Er85AtfoC6hA9K3yZI+BbGvTMLB/t7UHdMWf
	 c1pymEeKLDe0UizE1xS5gpm91TcnWQE+QBEzAmvI8FNKZK23OYyzLYGU7vqp/2/cKRWpm
	 TOPhnN3DX6nnCwue72rI5xaie057Ah5i9iNAUrwZOFxE/DedIpzQgUwFhRDs5tODNu0hv
	 Ax4LSY4qSp+usLa24+PJ4mXeXDVvN7uWBR0Ix1F8cKSnezjNlWDKTQa6i4P0IvcAwWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aYDYfTgx;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F64606A322
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F64606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aYDYfTgx
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b13c7bb0deso24029337b3.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067575; x=1793672375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHrcVfVURsCK7PM42eHtwMFIpRh89A5AI9d7463hUf4=;
        b=aYDYfTgxhzNih+KCle5OtOY1DQZ369aokBe0Rqzdo5j/hFQOe1MypyJTghY7w+VYm/
         M0XXqRTk8QJYAKHbr/zQwjtxd+f1j5z/pTFovlDvQwINK651iKJh60jIdQeS4BUeA1FD
         weUO8PRTDBFve3SyaomNJ6t3PYGcOG14+rILLGEe9CoPaLSbAjBIy9QTvL/WeIXC7Ohh
         +oSyb4kBg2ohivAjYgsCH1zUQQHkOwkOUyDZief9rBJxLQ+VPI5zoz2NMdDuSdIK5eDq
         db24jCOC9sCaj3sGw6RQV9sptk1dbWuiSfrTpmUyyaUMQ5KpGmPrpYxtFgZi+vs/ye0j
         vsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067575; x=1793672375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DHrcVfVURsCK7PM42eHtwMFIpRh89A5AI9d7463hUf4=;
        b=BvMjhhrTjfQ4WbVHhrzbeP+WGGoZl/iNKCpxLkO1UFA6uLtB7TR3AE0qcgxebJE8Gv
         0pmzoqHPiz2xoa0WVLQosst/veWaZtggXe6vz7mlNRrnvFsDFrQX3Qu6dsNglKFXjjI3
         3d3Nb4m7azqV6hVKr7ryHRGft1jo53ry4TtRgT+LZde0d62weQO2faQ6c/LvQwy1kFFb
         5Vv/r+k48ntmdFoBkDWh1oSfJ4iODuyJnkU4DjYSdaz6n9RiLLZzIdp0SX9lNSm1ByAD
         3C0Uw2rZzSSZTnJhQinC1Rja/Ko5o5qU+Ha4vhSopDawnGP7g1UxesvndQYWed+LAtWK
         eyNA==
X-Forwarded-Encrypted: i=1; AKwUvBzixCIhKWsVPC8Ha0JcOlRpgcnTwQd31kjiiZaSmHbRGm0YtfkObwycnZMZ/2Drk/R9fkfhedFYV575iA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKWnfkbO0Fi/2TWZ9vbhcGlI5+o9v3DhS1+6tF7Ie1zwDWt4HPZ
	F/8arzrgeNzY3VRG8W2vpd9Kxgljit2LAz8mbyVeJ+nyxrvqyNjvXbVIS6w6W0WAzy0=
X-Gm-Gg: AYBFou2ErY2UGipTcrr5rJHDyVj8MdnTLrXx4exkXOglKRA6ueIWQGeCl82I3OtgJ+E
	4ioAUc1s4lcq7XZa56i45scg4hFeXzCB4b4UU/W5SeOcJSImf36XV/I3Ap3fW2vfDzH9kO8VT/v
	TCUtUyuQtpWAhNnEjiqv2s7fsO7vXoRBfQjCp8P1D43LRh0mRO34X2X7cbFH6NOzpwK3FOy3l3o
	aGI50TL/kMrSMJ6d2vVFx+kOP9TW3jlkM88NYhzzN+5k+DjrRflV4Q+Wfbf6uan2sm6QgQYig0G
	gCly7HFEmK6Lp7X8J2lGFdmY2TWK3m8mpXSXGtY9sT+HchfrT8E2WfeJz31+DUL6RxxZXBaR+Kj
	qQcyIM2SgdIQpzdStOlP3mCxT0F1dVkHnseKsZ8vsidxqbsA2KO8syJAo44fHLWDjgIZ/zWagO2
	VO/ZUr/x/m+R+B37kuoAYYXKASUWL5QBKTIK1D+tGgVEQWWMHOXEeI/AlVl6MoFqthCujSadk23
	9ZZfS8EyJwb/Ue335MKSPruqyesOBtH7pQgcvWg7FfihVsp3Or721Auk3rGs0t18shB/YBQKkAG
	O2U20zOwnb7k0Qma5BaYXj21QKwWf85m
X-Received: by 2002:a05:690c:4028:b0:8b0:c673:9958 with SMTP id 00721157ae682-8b1669cb3a2mr50043147b3.3.1793067575123;
        Mon, 26 Oct 2026 19:19:35 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e61d0cdsm5033647b3.40.2026.10.26.19.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:34 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 0/5] media: iris: ffmpeg decoder flow changes, for reference only
Date: Mon, 26 Oct 2026 21:19:29 -0500
Message-ID: <20261027021934.22113-1-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
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

These are the local changes behind my report "[BUG] media: iris:
resolution change handling stops ffmpeg's h264_v4l2m2m decoder on
glymur" [1], posted because Bryan asked for the code [2]. They are for
reference only, not for merging, and carry no Signed-off-by, because I
can't review or defend kernel code myself. An AI coding assistant
(Claude, by Anthropic) traced the driver, wrote the changes, their
commit messages and a test client, and ran the tests below, in a long
interactive session that started from "make hardware video decoding
work on this laptop". Each patch has an Assisted-by tag.

Patch 5 does not work for most real streams, see [3]. It resumes the
firmware through iris_vdec_start_cmd() while the driver's internal
buffers are still sized for four frame buffers, so streams that need
more, x264 at its default settings among them, end in a fatal
firmware error. It is included only to show where the driver could
resume a first source change itself; a working version would have to
re-create the internal buffers first, or resume only when they fit.
The commit message of patch 4 notes that re-creating them at a later
VIDIOC_STREAMON(CAPTURE), in a different situation, made the firmware
return nothing at all.

The patches and the problems in [1] they address:

  1/5  Don't flag an empty source change LAST buffer as an error  (2)
  2/5  Update the CAPTURE stride and size on S_FMT(OUTPUT)        (5)
  3/5  Signal V4L2_EVENT_EOS only at the end of a drain           (3)
  4/5  Let a resolution change drain before stopping CAPTURE      (4)
  5/5  Resume the first source change if it fits the CAPTURE
       setup                                                      (1)

Testing: the same changes, in the form that applies to the linux-msm
laptops tree, ran on the glymur laptop from [1]; the functions they
change are the same there and in media-committers next, apart from one
line of context. These versions, on media-committers next, are
build-tested only: each builds with W=1, sparse and smatch without new
warnings, and checkpatch --strict warns only about the missing
Signed-off-by and, because my clone is shallow, the commit ids in the
Fixes tags. The H.264 and HEVC results in [1] came from clips encoded
with -preset ultrafast. With x264-default clips at 640x360, 1024x576
and 1280x720, the test client from [3] decoded bit-exact when it set
up CAPTURE after the first event, so that patch 5 did not act. Not
tested at all: other SoCs, and HFI gen1, which patches 3 and 4 touch.

[1] https://lore.kernel.org/linux-media/20261026160952.22082-1-ccortner@gmail.com/
[2] https://lore.kernel.org/linux-media/36201ae2-1cee-4d8d-9381-dfc9013c522e@kernel.org/
[3] https://lore.kernel.org/linux-media/179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com/

Christian Cortner (5):
  media: iris: Don't flag an empty source change LAST buffer as an error
  media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
  media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
  media: iris: Let a resolution change drain before stopping CAPTURE
  media: iris: Resume the first source change if it fits the CAPTURE
    setup

 .../media/platform/qcom/iris/iris_buffer.c    |   7 +-
 .../media/platform/qcom/iris/iris_common.c    |   3 +
 .../qcom/iris/iris_hfi_gen2_response.c        |  40 +++++-
 .../media/platform/qcom/iris/iris_instance.h  |   7 ++
 drivers/media/platform/qcom/iris/iris_state.c |   8 +-
 drivers/media/platform/qcom/iris/iris_vb2.c   |  23 +++-
 drivers/media/platform/qcom/iris/iris_vdec.c  | 117 +++++++++++++-----
 drivers/media/platform/qcom/iris/iris_vdec.h  |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c  |   1 +
 9 files changed, 176 insertions(+), 33 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.56.0

