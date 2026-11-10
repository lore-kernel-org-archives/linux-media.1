Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294278;
	b=Cb2KNgycrF6ZrTdB3MSuvmOebWYss9kD+yj4Z+eMUGUWoeJ0bXFWpuQk2n+w8eWySk13
	 nKw4ytSYm1F27Pw0fSj2EDNYrEtmCbWHvjy0nxyvYgxrWrxD8vsId8o3euCAjnygAtOey
	 gW6LNemQXYKd0wO9N+oLAYJSh+CoZ4lyyeXzCNborGviwWxon7dNpWInBTBH2Cx4IjJM4
	 X2PvZnzXjyDC0uhqbw+D1wXKmasFG6nrWMpnWnSofZsmyZfqTDOkHPXjKLiz3aGxzkhcF
	 UnpRLaxZnV+2guD+PuahhQWHyZ2LDgD44cQFnT9UKzQRUANEX2DG4N+O2kDzCbSnWJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294278;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=ehyKSSubsQ3ecNy9eM7eWLGxpE5AFmj7l5Cxp8L0dfY=;
	b=N/thxW280Sv8sVJqpQXZ1M0VdWDp1WjCN3c7u3uLaI/ngTNKOhspeskV5Xamisf72DuG
	 Obaq+ia4b9Be5GMqJ+qeelGKHhjEKSBRAukt9Ztg8TAKxRUQKLy4uyxOsFJbrhRqLAjiM
	 yb8uDglFp7pM6cOVm1Shhfo/4pMGDs5leffw2uPwQtAc6iN2QIeLbahO6UMIzFba175rw
	 R+E2cAqhDkhVyFsPpO6T2F4NvY9I+yAF6ZmZ2ai1KOLzGIM5tIMy5wqGRwL9KCY6UAVoT
	 8SUxd7uKR6/T+KDUpaDXNF9MieuhvZzQJrBxr2/Qz1QwDyMGmr/RrFwECHoZL082oIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=XLY+FtIF;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB003606A31C;
	Tue, 10 Nov 2026 07:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB003606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=XLY+FtIF
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jNyM52Z0FzKqL2;
	Tue, 10 Nov 2026 08:04:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794294273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ehyKSSubsQ3ecNy9eM7eWLGxpE5AFmj7l5Cxp8L0dfY=;
	b=XLY+FtIF75cVqIrp9ug/rEZowOjusw2GdXnqx6PSUGwJsGJ4SnteGdxr8Sv6k77RnAmdfv
	b38pUrxiTOQQRmTkBeGQmY69nRO9qXUYIPZ+vJEEYU9B2yC+njaR+61uqAk0z729lnD93i
	L7hLKH/pTmMwjIUjUy4QB0wNlpczazIlGivESsOkFeobwCg4JbI2mTL+ifaTMrrPK+ZnS2
	rOvEUYWonFEFL3lnwhdw4AI77hauioG4+Yb+E8BzxyNbYcGUwG16+qm/SBjq3eY4rouwF5
	VzeFd5dLRP06laOIsUIrORv0vT58E7X18QpAIOyyND85vbpOUax5zeu5Uv7erg==
From: Tobias Hahn <tobiashahn@mailbox.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: iris: SC8280XP firmware stops responding after a decoder client is
 killed mid-stream
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 08:04:31 +0100
Message-ID: <179429427186.1835985.16996823740690159470@mailbox.org>
X-MBO-RS-META: m56mb8wjrmt8tp5axmbzbwdon3g3dhtt
X-MBO-RS-ID: c8d9cb1d0e59893083a

Hi,

a bug report against the stock iris driver. Note: the reproduction
and the measurements were done with the help of an AI assistant
(Claude); I've checked the observations on my machine but have not
analysed the driver code myself.

Hardware/software: Lenovo ThinkPad X13s (SC8280XP), firmware
qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn
(video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565,
linux-firmware 20260916, HFI Gen1), kernel 7.3.0-rc4, iris driver
unmodified from v7.3-rc4.

When a decoding process is killed while the decoder is busy, the
firmware sometimes never goes idle again. Afterwards every two seconds:

  qcom-iris aa00000.video-codec: skip power collapse, wfi=3D0x1, idle=3D0x400=
00000, pcr=3D0x0, ctrl=3D0x40000001)
  qcom-iris aa00000.video-codec: failed to suspend

and every new session fails:

  qcom-iris aa00000.video-codec: session open failed

The video block stays powered (battery drain on a laptop). Only
reloading the module recovers it (rmmod qcom_iris; modprobe qcom_iris).

Reproducer (8-bit HEVC, 3840x2080, about 8 s):

  timeout -s KILL 0.8 gst-launch-1.0 filesrc location=3Dclip.mkv ! \
      matroskademux ! h265parse ! v4l2h265dec ! fakesink sync=3Dfalse

Varying the kill time between 0.4 and 1.2 s, 3 of 8 runs left the
firmware hung with the stock module.

With a locally modified module (the 10-bit change from my other mail,
which does not touch the session teardown) the picture was the same:
4 of 8 runs with a 10-bit 4K clip, 3 of 8 with the 8-bit clip above.
With that module, killing a real-time playback (sync=3Dtrue) did not
trigger it in 6 runs, and neither did mpv stopping playback in an
orderly way (0 of 18). So it seems to need the decoder to be busy at
full speed when the file descriptor is closed - but those negative
results were not repeated with the stock module.

Happy to test patches or provide more details.

Thanks,
Tobias Hahn
