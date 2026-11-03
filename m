Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.250.237.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739713;
	b=W5z4t5f8z3uvGQ31lE5czeHrWVduZEVAXnW0mi+nZaIMbmRcSfDihLiXMPA7Xa/VgyKo
	 pOdmk7CcswJg5pd0CgB5XbDpWT4/LSDY6A0L5C+TVi0k9hxzjo6tGEMulMmznlG2RoRh1
	 /bKMO1QxY6FRABUcsDQ8+bJOCIisAb5t7w256rvwOzJhv9S3+Sg4ZBVx4u7z+evVn5bmH
	 GWhdVrGeg69WNkTMZCMnkGrhyvFenvc7cSXWUkGSe/wVa72eSntxtM5AWME2MSyHJhCY3
	 1QQT7TEGlhlsCSTtdyjOmPaOWNtitn9MF/RdA7EleeSUcu/NvA/LjlCSNWeDGCNV3PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739713;
	h=DMARC-Filter:DKIM-Signature:Message-Id:MIME-Version:From:To:Subject:
	 Date:List-Unsubscribe:List-Unsubscribe-Post:Cc:Feedback-Id:
	 In-Reply-To:References:X-CSA-Complaints:X-MJ-Mid:X-MJ-SMTPGUID:
	 X-REPORT-ABUSE-TO:Content-Language:Content-Type:
	 Content-Transfer-Encoding;
	bh=99BNe2ATmoiv6MkGfulWJTv1Uz34GDHfOl50x43wT/o=;
	b=pUmf136k1DjSWOlZGhQzW3pkf7V/YANzVBR/3EfUakd00w8gdznahmiluKFpnAOxTqWZ
	 /qWdqjmbEgBNvxedWedTDkB+BThacMTCPkqei9J3WiUuMgT1Px9KC98V3auRzcIABEMjP
	 IQbOfyTxvv8S4WltpqqtFccxJR62JC1DmygvDHIl7UbIDnNmIXvbovA4MGFnGTIHyk2fO
	 FICPRLvfN7viee4izHxwtTkiSdsHDZGqWO+r4I+ulEayDvDNWpgFo+YRFiELm+6qO1SEX
	 v0d3iINo0mau/VCD68i4xE8/T/rFsfdLWK+RVv0oZSiUlH7IHIARy9scbm3fLfi8W5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hit-on.com;
	spf=pass smtp.mailfrom=a665032.bnc3.mailjet.com;
	dkim=pass header.d=hit-on.com header.i=technosf@hit-on.com header.a=rsa-sha256 header.s=mailjet header.b=PZuvgf2X;
	arc=none smtp.remote-ip=185.250.237.61
Received: from o61.p38.mailjet.com (o61.p38.mailjet.com [185.250.237.61])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 37024606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37024606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hit-on.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a665032.bnc3.mailjet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hit-on.com header.i=technosf@hit-on.com header.a=rsa-sha256 header.s=mailjet header.b=PZuvgf2X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; q=dns/txt;
  d=hit-on.com; i=technosf@hit-on.com; s=mailjet; t=1793739710; x=1793746910;
  h=Message-Id: MIME-Version: From: To: Subject: Date:
   List-Unsubscribe: List-Unsubscribe-Post: Cc: Feedback-Id:
   In-Reply-To: References: X-CSA-Complaints: X-MJ-Mid:
   X-MJ-SMTPGUID: X-REPORT-ABUSE-TO: Content-Language:
   Content-Type: Content-Transfer-Encoding: To: From: Sender:
   Subject: Date;
  bh=99BNe2ATmoiv6MkGfulWJTv1Uz34GDHfOl50x43wT/o=;
  b=PZuvgf2XflTcH9pWl3CehFa0D8W7uRMbfPMmupEacRvXV1akrvlDpcYj4
 7soz7YLs8JcoYZl0GeJYSPbJQP7M4EO0Dw6PG/KwP7N74NaF9SnqLpUPbl+x
 05oS7fChcHUQ3ZY7voc0kpTUu96/A+qLwG+iXLJqLgG6FmcK9c6ojU=
Message-Id: <84987dde.AWgAAKs7n0wAAAAAAAAABIOZQcUAAYC7iywAAAAAAAolyABq6ku-@mailjet.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: technosf <technosf@hit-on.com>
To: Marco Ziliani <rylos78@gmail.com>, Daniel Scally
	<dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers
 on stream start
Date: Tue, 3 Nov 2026 13:01:46 -0800
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, Tony Garcia
	<tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, "D. Manresa"
	<dmanresa@gmail.com>, linux-kernel@vger.kernel.org
Feedback-Id: 42:665032.636407:MJ
In-Reply-To: <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
	<20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AWgAAKs7n0wAAAAAAAAABIOZQcUAAYC7iywAAAAAAAolyABq6ku-UhKrtzZOS0WkeSX2SglKAAAJtfc
X-MJ-SMTPGUID: 401ba90e-fe83-4148-aa59-d4bdec013fac
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Tested on a Surface Pro 8 (Intel Tiger Lake, IPU6; front OV5693, ACPI
HID INT33BE) in a 7.2.14-based linux-surface kernel, with patch 1/3 of
the v2 series applied to ov5693.c. The tree also carries
linux-surface/kernel#180 (MIPI clock lane gating), loaded with
clock_ncont=3D1; that is not in mainline and is needed for the sensor to
stream on this machine. The in-tree 1296x972 and 2592x1944 mode tables
were used. Raw captures from the ISYS video node (5 frames per stream),
one module build with the patch and one without, each run from a cold
boot with no gap between streams so that the sensor stayed powered
(autosuspend delay is 1 s):

- Without the patch: stream 1 (1296x972) delivered 5 frames; stream 2
 =C2=A0 (2592x1944) timed out with no data and the pipeline needed a
 =C2=A0 reboot ("stream stop time out").
- With the patch: the sequence 1296x972, 2592x1944, 1296x972, 2592x1944
 =C2=A0 delivered 5 complete frames of the requested size on all four
 =C2=A0 streams, with plausible image data in each.

In both runs the CSI-2 receiver logs "Transfer FIFO overflow" and
"Inter-frame packet discarded" errors at stream start; they appear on
every stream on this machine and are not changed by the patch.

The test scripts and this summary were prepared with an AI coding
assistant (Claude); I ran the tests on my Surface Pro 8.

Tested-by: technosf <technosf@hit-on.com>

=
