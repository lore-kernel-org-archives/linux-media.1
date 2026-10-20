Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525197;
	b=DtVpSjG7ApWBhtL7yEy8dv8YMF0bRa8tIZcfJIYou39aBefaY6lFTlg9OGU6DEZP83bT
	 hJRywYrAbK7V4KyBT8AM/eOPfX3ZFQdgge3WcRYpiX1dRteUae8NTcuL+fYJgebyBnz6f
	 nF6lkkcOGsgYs2CWAKkyeIVsqEDVl0tgRv9js3I0zrRy8l3mZH7hMAYXlt9MbR+ZQWx5w
	 uI7uzZLEeLKWQ+DfVV4wMikfNnnx9HoRWluCKCvH91LBjXFvC6jo/rakICOd2oZmPFyg0
	 nw7gaUPU1ogSJbnHLUPceOfWGkjgEy7I9EbzB32+F4SCy+CKx/RpK4ZEWeG7KFO8A5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525197;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=39Jv+kqfa1W32Czq7DzcERVJw1tDLMb9xcUQlCNYUDA=;
	b=XHLdkyGO99qnkcTR/kV649NoVq1zJdyY4hJBvbuudGA9LYKleA2pDIel38lpXf7VpIBG
	 jBanOI7fO4itUY2ZaXkhtqexSRPSr/WqjwReSdyKmWbKSO/WP8td1jLtlgUxIVsTr2Pdm
	 z/QpW/C25Pxolc0AGjoIFycv3EY5d183iggQd5aWpYOGbSfDBZs6it1/It43D5rBlmG7e
	 IBWwOLfUKbKcnAIVXHz+dnsj9xuWz5X48QLO+t5ro7/95iO1kKWs4gbi2DPdImhUpWli6
	 ao5Da5SSyZhntJ1VXrLFkrgpPbP668x2RYVSrd6k6VR2ccpnJQdU3SoUWBz9MNptY8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=OF0OjImZ;
	arc=none smtp.remote-ip=79.135.106.28
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68F606A31B
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 19:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A68F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=OF0OjImZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792525193; x=1792784393;
	bh=39Jv+kqfa1W32Czq7DzcERVJw1tDLMb9xcUQlCNYUDA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OF0OjImZDwAsauYZbPVrHaaLs+pBj5Lbp5aWbOtvqEU4FcaWQKBxiBIzpkEpyJPaJ
	 59cphzhKV4nKT5rfEWzlGrO5aB6JcS94XoYcJRj5Wd1fVWkHwNTZxwXkohoa89ImFU
	 1pUPVrashP3er3tWCHfTIYzyBUEBxMxi7i8D/0g2+L6uFc2/qY7eAEPHlZrOgeWLnB
	 TzHU7KMCGQr3ikEZOQKM246X3t/wkDseBqA65i0fuG4SvIFUJmiv459R0YptWXsFxe
	 ACsHGLy4oAeTcTJhwfVt+wfPhtTEPmawOCUHVkrxg0FEDOUVYXU+csm/d0dmH22May
	 G1hyxevuqRU/w==
Date: Tue, 20 Oct 2026 19:39:49 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i2c: qcom-cci: Recover after a target powers down under a running controller
Message-ID: <20261020193946.51478-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 119cb6a596ebf28c973df8dc27618c54b90a8d4e
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

On the Lenovo Yoga Slim 7x (X1E80100) the OV02C10 front camera on CCI1
master 1 fails to start whenever it is opened again within about a
second of being closed. The first register write times out ("master 1
queue 0 timeout") and the stream does not start. Two attempts so far
treated this as a sensor power-up problem. One gave the ov02c10 driver a
longer settle time, the other a minimum off time for the camera rails
through regulator-off-on-delay-us [1]. Neither is needed.

The sensor holds SCL and SDA low while it is powered down. If the CCI
controller stays clocked from then until its next transfer, the master
no longer starts transfers. The queue stays on its first command, no
interrupt arrives, and only the reset in cci_run_queue()'s timeout path
brings it back. A runtime suspend clears the state too, but only when
the power domain collapses, because cci_resume_runtime() does not reset
the controller. With the 1 s autosuspend delay, any power cycle of a
target that is shorter than a second runs into it.

Patch 1 resets the controller on every runtime resume. Patch 2 suspends
it 50 ms after its last transfer.

Tested on the Yoga with the driver from i2c/i2c-next, built as a module
for a 7.2.8-based kernel whose device tree has no off-on delay for the
camera rails. The CCI clock runs at 37.5 MHz there. Starting the camera
with v4l2-ctl after a pause:

  pause          0.05 s  0.1 s  0.2 s  0.5 s  1 s
  failed before   19/20  19/20  19/20  19/20  16/20
  failed after     0/20   0/20   0/20   0/20   0/20

With the series, 150 libcamera starts back to back all started, so the
sensor itself starts fine after a 50 ms pause. The same two changes on
7.2.8's driver, with the CCI clock at 19.2 MHz, gave the same result.

[1] https://lore.kernel.org/all/20261001-regulator-off-on-delay-v4-0-258ba9=
612da8@oss.qualcomm.com/

Birk Skyum (2):
  i2c: qcom-cci: Reset the controller when it resumes
  i2c: qcom-cci: Suspend the controller 50 ms after the last transfer

 drivers/i2c/busses/i2c-qcom-cci.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

base-commit: bd4a545e4f5dbd5e4dd0064777429813516b8784
--=20
2.53.0


