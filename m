Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049198;
	b=zJEpAEgOQXQBNNkjF4JmtkZ2uD0lQI0MCa6D+vv80115EXVsDWNgUNbOpe0NlU/s7L9f
	 wKbM/sSAowhSjUBl+NkE0/k7YrlIPDlcbSbIhhHDSoU+8qL/dmVCYTb/J4DCO7JBLMoJO
	 PprHDvTz6UVG3FLcTIGbajq1un4ZIiFfSw0rOJ4MhHV2gdDMOHRQdk33aB7El1EfhQC+O
	 RjGwJRqZOW1CCd4L6HXogrReTSdTpJhphHMe0ydVZJ1s5UPL2MvRpsNBxgx1/Bjd5KVnP
	 e2Pr/KkI3l/FfIHzAHdQEWvgJYsWLU03jUEmPpULW6fWKfaZ/ZaUG+zpATw/9YKKpXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049198;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wm/jfVtYuvPcst89Rkgn+wyHYbw6cluHv8eWnAuQspE=;
	b=0LAFnt+5YCvyU0GfR7srBvHkBN7QDqSp1ILpEVRYNl85JHfPbwsiuhdKOEHNy6kkHe7A
	 Ye4oV633wZ+YnI8JeyPnqOTc0xDWKgY/aMvcgkhBoV8eU+GFfXeKdFRCkpMJspbNewkz2
	 eXSIeQSIeNu9FwWzDBafsQlcYXPDxNBogF/9LxuZ5Y+EgfVegv+0QBo+xuUrxprrKtdy7
	 9yBG149je2VFGNB9DiG9Y+f/KxbubEmxN/4iThOVOxvmQ2tkpMfaGgsuBzpocUlA18k2N
	 1DoXc0+qZCvXhRl40LBuUCN0eTJ6hxI48Rz+FWrYN9hjjH4o7aX2yIghQrgNFJ0DEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=GBY+tZfs;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD1606A326
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 21:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FD1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=GBY+tZfs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793049195; x=1793308395;
	bh=wm/jfVtYuvPcst89Rkgn+wyHYbw6cluHv8eWnAuQspE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GBY+tZfsrQqd7WnFLTxOpdt9oDflSwKwAcoBGVRa7QzFZAheluR9F5eWW4YBGYIz5
	 aPTpNCIqWbN+/HiwP05l7pijzxq1BisBOi6ny6jXtHuC+JahQspswEC48xOuwfqsOK
	 GtH/u8GQuQUHKtHgjIRdK7YLHNOXucgi1EHQTY3NFy87WgKKpZ8V8UzDu0+MzycM89
	 IQ+dKoBNhS9iymA6J7uNTb8GzkGBhv03juSSU7+Tv3yATVP87oPnwM3Hm4wUjwi+vC
	 JFLKlcm10NuA2wAyKh9sfSYXDIm/+hBdOlPACrGyBsJk+t+gAr/rVFcK+mePWvMwOO
	 5exmSt/hyMoMA==
Date: Mon, 26 Oct 2026 21:13:11 +0000
To: Christian Cortner <ccortner@gmail.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [BUG] media: iris: resolution change handling stops ffmpeg's h264_v4l2m2m decoder on glymur
Message-ID: <179304918733.94372.5877769928931868407@pm.me>
In-Reply-To: <179303700379.61096.12413812442887213723@pm.me>
References: <20261026160952.22082-1-ccortner@gmail.com> <179303700379.61096.12413812442887213723@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 5ebe2d9dc2c49ca9445c8806f7b9bdf81794be8e
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

A few more runs on the same Yoga. HEVC and VP9 are affected as well,
and so are some H.264 sizes above 360p, though less often. ffmpeg on
3 second libx264, libx265 and libvpx-vp9 clips, 3 runs each, compared
with a software decode:

  H.264  640x480    2 identical, 1 ended after one frame
  H.264  854x480    3 identical
  H.264  1024x576   2 identical, 1 aborted after EIO
  HEVC   640x360    1 ended after one frame, 2 aborted after EIO
  VP9    640x360    3 with an extra frame first, then all 90 identical

The extra VP9 frame comes with "capture: driver decode error", so it
looks like your problem 2 without the stop. I had seen the same extra
frame at 1280x720 on 7.2.8 earlier.

mpv 0.41 with hwdec=3Dauto-safe,v4l2m2m-copy, the setting Omarchy uses
on Snapdragon laptops, shows what this means for users. In 2 of 3
runs at 640x360 it showed one frame and ended playback as if the file
were over. It fell back to software decoding only in the third run,
where the decoder failed outright with POLLERR.

Birk

