Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037016;
	b=UHhLljVzhhnID9G+NNDeXvnL/tDBMMwhkH7nWy/RmUt4YwBCUkg68jKofIjERua8RvW8
	 zVr73f4YKPFRB8FDUvRkrP2F8olSuSUd3zDnFXfARtnsuAKAHKb+LhzA2I5Wm+wDJgTlp
	 gBAVBxpY/JhYN7Iql1uTuqTNOu4O1r6VzX8fo2g6W+rpA72yoquhbYNi/KLTHRY3+Qers
	 RxrIPWuq10q5vW0GgEMQeTyPJmrBEKTXW/n5ftSG1QGoxLKmJbiEIbjYP6MZk9HEn7B2g
	 0uUZm9plaXrQ+qvw213GNqxO6WteNf7ymQmMITpA6KoXaJVxdG57yuUzQ2Gpytzo5VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037016;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qtvLQFXYLH1xZASuIzh92uiv38RJQbKSHMJOqz45oZA=;
	b=nzJ6hzTR+DYT+4ZurUrXopuHIe6EZeDTO6XbAwuIJwOc3+duzU0iTWhcJGQaUK3h641L
	 MT9ABvmAQcTFca6DBysNIgqwHAFI7AxjD1b0j9waE3re+li/GOgd24JBa/ajhnu/to8Y1
	 oSnqh38TCVSZWL9Kv9B3NJkNm3zbK5A41QYNt4lWHR7Yz0XjFfaPM3qQpqAhGP8XbA7Le
	 PJM/920KE1StK5i1ob1dhIY+v79j0ZQlraBjz0fR6+7AQaVLpb2fqq5TlLnBou7stCe1n
	 8Spvjrwd6tuaLRYf61wX4La2u/QIZwSRighieLaAtl7hCG6Wk/Pvo3ajFQbcZ0YahhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lQ+Mk76s;
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F57606A31A;
	Mon, 26 Oct 2026 17:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=lQ+Mk76s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793037011; x=1793296211;
	bh=qtvLQFXYLH1xZASuIzh92uiv38RJQbKSHMJOqz45oZA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lQ+Mk76s7lWRpR4oQYMVINFINOJF7IiFHz/Z0vPf2hM3mOhTeJiU2vJNP3/kqHDaw
	 Ryo+E1tzDh0C62qfP4qFjdzXbaT7UWO2am6uabXA45t9R74aljhs+S2y4ildWJVfVh
	 AWx2G2sJYxAbWgkr7HFP+/5dP4IBdLYV1Lr2Tbgv1GoOurt1hsknVbTSiCJ4SywiRg
	 M3hYhclG0YJeJTF953qCAAN4l0wOY/ew+LjYLVfDqFQsHrUHLrWGSxyB8NkHUviDVj
	 +5UxrVTCnZ+Svwj8t7vyAXvIaFiTU9WhMKjJAZX20Ixu2nnS3iKRGEUQNU5bimvA0U
	 9w2OK84O9+cvQ==
Date: Mon, 26 Oct 2026 17:50:06 +0000
To: Christian Cortner <ccortner@gmail.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [BUG] media: iris: resolution change handling stops ffmpeg's h264_v4l2m2m decoder on glymur
Message-ID: <179303700379.61096.12413812442887213723@pm.me>
In-Reply-To: <20261026160952.22082-1-ccortner@gmail.com>
References: <20261026160952.22082-1-ccortner@gmail.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 8f1d016c07f8251b96f90316162772dc61b152e8
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 11:09:49 -0500, Christian Cortner wrote:
> I could only test glymur. Birk Skyum's h264_v4l2m2m decodes on
> X1E80100 matched a software decode [1], so problem 1 probably depends
> on timing.

It shows up on X1E80100 as well, with smaller streams than the 720p
clips I had tested. Lenovo Yoga Slim 7x, Omarchy's kernel (v7.3 with
a few Iris fixes from the list, none in the resolution change path),
ffmpeg 9.0.2, h264_v4l2m2m on 2 and 3 second libx264 clips in MP4,
compared frame by frame with a software decode:

  1280x720     every frame identical in 17 of 17 runs
  1920x1080    every frame identical in 3 of 3 runs
  640x360      one frame, then the decode ends, in 10 of 11 runs
  640x352      the same in 2 of 3 runs
  640x368      the same in 2 of 3 runs

The one frame comes with "capture: driver decode error" and ffmpeg
marks it corrupt, as in your problem 2. In the other 3 runs ffmpeg
got EIO when submitting a packet and aborted:

  Assertion pkt failed at fftools/ffmpeg_dec.c:753

In a series of 8 runs at 640x360 the firmware also reported a fatal
session error, five lines each time, in 2 runs, one of them the run
that aborted:

  qcom-iris aa00000.video-codec: session error received 0x4000003: fatal er=
ror

I'm glad to test patches on this machine too.

Birk

