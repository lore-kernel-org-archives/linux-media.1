Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159018;
	b=Q4zeXOQSFpUm5S0aLWmdNJwIVAbEzVMFqYo9gPgfm7CIee+e9NZVTFHTuTOatDNGrdIM
	 +n0C4IQNOReXBD5V5KJ8m/Lth9YjVmPBcZhmKhX5olJvfnLlXx9E/ldGw0vCeb7bG0K1I
	 4Dla6mx8fziI0S0mYx6Hik2YAe/yqV2AQ0VQjAiBdVZDV3L/zRmkkPXeQD7IOfjzEy0Ra
	 j9Eq79LLTT5JvEN3OfoHGpYkWUig4AeI0FKPMxG0eI9fAtLhKt9xLjEH/CaHV/Q6EILOm
	 SRZGp28fBKGIuv1Ap71JuNTWFDCfcIswZxImtXEHOlgZ5q9dnZBenIoj3istDiO1VwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mPIPaScXxM7/HZ6U1XsdkuXcXnpJuRB9yur3ZHgAH5A=;
	b=Ye9sxSONuPpI93TAoyaGSCJDGjaNFv+YgbNn7v34PZy59dVDIz7FwP9mAxlU/CeqTc4n
	 Yb867uLqchovoWfxPBtYnOz0hJ0IbZ3uRwkIUXCKwuvWAlouOPaKx0EAiGMotgVgeS0WM
	 xnI6fETBCS7w56PzoGuihbh7Ly7Uerqc2ZfjHFhKRF2c+zCnXhrCTO0tv0iivBgExYUIJ
	 MdwoLcwYoynt49RY/as5LKQKjZnl5B4zH14E62XGR5bSyIQW1PNaOHp/4By/7Ajh4iSec
	 JDdHO0IrnPGZexCwjQatFo23AMAO0/LBXYkJwNgy7EfE7jDV4EhvK7xIqQ2OAicKuig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuBEyJqj;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA8C606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuBEyJqj
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5361e313e63so7102171cf.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159017; x=1793763817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPIPaScXxM7/HZ6U1XsdkuXcXnpJuRB9yur3ZHgAH5A=;
        b=vuBEyJqjy2Y/qkxHE8f7LSkZYKjbb6jNCDeiCQvtCAw4aKQG9fR7Rhyo+QcfqmEZPl
         WLNqT0knDQcvbEBDxwUN9pa/JBur5HvrlMLwC8HGkb2ZjAoflrPpxhKxmYK5EbsyA5Zi
         a3dDLjI7A7nupnVBucwgtjsyJu3NvvWJPSwdzw4zf0YEasgAL2Ky4rA6KY0Sl4mcQBVb
         /V/X/Xgrw7OHddSkJAA36v5HAbzX8T0jQnGRBEj0TjsFMJseRKxLgIV39qS+4zsMn6fU
         GVb8+9PcmUBRTgOJyJh5WiaTGEsPx0LNpt8SEMq//Xe2r9biTq8vR4+6qwo6oH2GYcmU
         nxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159017; x=1793763817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPIPaScXxM7/HZ6U1XsdkuXcXnpJuRB9yur3ZHgAH5A=;
        b=1ypAJN788t+4N4axk9jxeNUZiFkyXDk8V7TAiYAWNN6fDqvc8u32368BUhYF/kYCse
         FeYTbdf+hrYzEtpqBj6UDDabtM5dFBRpkrCpljDP2jNVlpy7pzPDkVGN1dMmMu0xG/pb
         XF+Gt75YXXRDRsa5VV5tOOmRMIWWfI5cjZsaCXyS/MnWo6DjU1d/BI1ovvT/y237wfEO
         +0S9BXxhjF62BoNzYqOYjMP96y1gqKRJvAh91zIixQ5Nwma55HXj6Dvt2bp0mQXVIjGO
         7OBMLYAq1OHkDTeyT09jhKNb9htj5wbbrDRWdZJ0EFY+Ofb7OfomkbDRVKHO7wVaAqKz
         Pn1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxoUMb1a8qtxlN6nHJ7WZ1R+bNU7pAgnT0Z/H7wO0+tS60fPWW1hKfzhwlJ8KdDhiNauBDM6tV/5MqSGA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLV/Tx21mGjRrksebqHIQAFquBSW5Prk0GsBvco1QVZXlMwILa3
	ailGgzEXm8wMHw+AlXR5+0hXnF/bjCAcyrw2/gdPjlMVWQFU7+QK4JkA
X-Gm-Gg: AYBFou3Myku8hLlWMLSMzTwGsqV7dY3EBzLKmnVBwm0f6cjn4tlphI7iEcyIpBFDYmD
	MyrFST6w8xZbAy7bXSOcaN1CFq/9q2CVJhgDEGtwQf8QVrZrH6ugOOHfFHJ9aZGTFY0lH8zy59Y
	H7J2z72uOc75CicEts9fRpbQk+X/VvkKMPJOp3RRdT6jpsRr8aWkeleJFWDk/MrWzXB91BFojOV
	ASrPTK+NgjZ854P27iC6bfqmAsmrHIT+PxH3iyRHakVsLnl6E3kLturnuyJJ2XSdtGbuEK4spzi
	rNtXzVqGxyqcOtFRNuJ1Inbn0li/sktUbDSlsNMvZpVcKfFr2snaZXlY8OkPONnGXR/hipG/sa4
	iQpIATDp03ZHX6MXYokdNMf+fZKJApNm5Lt9g9MB24eBqCIFkkkDbkxKinLXYPPcJJhHRqci8iD
	Zi+SWOrY1icIHIHQ1p7x3UYk/tmF8k5Ggp28VkxVOoI/8hYCepCwyMadisgzD4Vvhhiw6Ocj6XP
	PR7751S6SQs2GmdO9GVXKlZtR2UbLbwuApaUSJy2AQc0l+dVJgwmyzOH6tXpqZyW3jzRsvVBC5U
	4v20pimZQcT4FAXFkxf18JeEZbdAuXHgQyLofNHGdDUYFYXQcN7o4HOYXND0WRDLQoVA1Cco+2g
	veZL7aA==
X-Received: by 2002:ac8:5d8b:0:b0:536:64a3:aaca with SMTP id d75a77b69052e-53fcc6caf38mr21641081cf.62.1793159016752;
        Tue, 27 Oct 2026 20:43:36 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53bec3a256dsm70148171cf.22.2026.10.27.20.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:36 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 0/4] media: iris: decoder fixes for resolution changes
Date: Tue, 27 Oct 2026 22:43:31 -0500
Message-ID: <20261028034335.26075-1-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Four fixes for iris decoder problems at resolution changes, reworked
after Bryan's review of v1 [1]. There is no Signed-off-by from me,
since I'm not a kernel developer and can't vouch for the code; please
take over whatever is useful. An AI assistant wrote the code and the
logs (Assisted-by in each patch). I'm happy to test.

Tested on glymur (Zenbook A16, laptops tree 65f4ae73 with these four
and the iris patches listed in [2]): v4l2-compliance passes, and
GStreamer and a spec-following client decode bit-exact across
resolution changes. ffmpeg's h264_v4l2m2m still stops at the first
source change when it sets up CAPTURE early (problem 1 in [2]).
Build-tested on media-committers next with W=1, sparse and smatch.

Changes in v2:
- 1/4: shorter log, with the traced firmware flags (Bryan)
- 2/4: shorter log (Bryan)
- 3/4: one helper for the EOS check (Bryan)
- 4/4: comment states the 500 ms limit, no domain check, warn on
  timeout (Bryan)
- v1 5/5 dropped: too much for stable, and broken (Bryan)

[1] https://lore.kernel.org/linux-media/20261027021934.22113-1-ccortner@gmail.com/
[2] https://lore.kernel.org/linux-media/20261026160952.22082-1-ccortner@gmail.com/

Christian Cortner (4):
  media: iris: Don't flag an empty source change LAST buffer as an error
  media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
  media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
  media: iris: Let a resolution change drain before stopping CAPTURE

 .../media/platform/qcom/iris/iris_buffer.c    | 26 +++++---
 .../media/platform/qcom/iris/iris_buffer.h    |  1 +
 .../qcom/iris/iris_hfi_gen2_response.c        |  7 ++-
 .../media/platform/qcom/iris/iris_instance.h  |  3 +
 drivers/media/platform/qcom/iris/iris_state.c |  8 ++-
 drivers/media/platform/qcom/iris/iris_vb2.c   | 26 ++++++--
 drivers/media/platform/qcom/iris/iris_vdec.c  | 61 ++++++++++---------
 drivers/media/platform/qcom/iris/iris_vidc.c  |  1 +
 8 files changed, 91 insertions(+), 42 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.56.0

