Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539099;
	b=k/NIZMnuv+EWxaMT/Qvq7hrataBfWpRZzw/fHiKnJFYcAFazg+4s2IS4s6V4zlVvcDa6
	 7K8q25wd3ga++dR8bFZJLBjSv/0ogBJvHjPOii6X9X3Qo2wxTvYuDdbraXaBI3HjSOiZt
	 HbV/cYwEPbafuXcawuz7gpBtq9jwp1yIIdLH/AmLknSaPDCboxfajdS8mnJtA8MLqODRn
	 vUTuAX4eLvqaCb0pv0EgiW5B2UthgOm8/w9EKmJRJzvB41dJYC8Z+Lpzk8wa+baqj6zBU
	 EsTXBJXk706kzaAYs86JWp4LUnJtn2fJzdPA5c5wbUJ2Ab7kegcVvCPICR9BeNTcdoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539099;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5+WaopsQCNIe/fAkrmCCZhKvCEHF4Z7bhw7H3RFZoMQ=;
	b=5lbkdj3wm5ECSofTv5OvHZAvs1rQ+zqjnwafzI60n3g0PPE70sBmu2huI8n2gzAgF6dG
	 fqDFvtuNT0x8tkH5Bod6UnTZDi3qfPz2FV08CwxSrWj2YYaDRHmvRL0ubzy/r+U/rjPKk
	 SLrguS9FZVSUB22Pm+x1S5woguTfJ4LIlRH6ah1noJd5xlRApkA7Cmoqly/gttf5JAEhu
	 WUzEh6rI2McWs/bichxscwbxuqfPhV/xE3veN6FIHTRCM1tUQzKQBy4+LdLUU7g861W6p
	 8cKQ5xvQYLsmKKlA/+B52J0i3Pk3kT+ZT9Amx4MuoYooRXP9KvyTtYC7p4jFDos2XoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=muJLyRCt;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86930606A31E;
	Tue, 24 Nov 2026 16:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86930606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=muJLyRCt
Received: from [192.168.95.178] (mob-5-90-67-29.net.vodafone.it [5.90.67.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AFE6B5;
	Tue, 24 Nov 2026 17:48:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795538933;
	bh=V3Ns5IOR0i5BDRm7zRbsioxO8t6rrCaGr/3MepLA5Tw=;
	h=From:Subject:Date:To:Cc:From;
	b=muJLyRCt51ZHNehnfo0SPYeEd2ypdLpx67ZKfRSZzzpau2tywhs+o9Q11/3Z5NMJp
	 A7Sy+KaWI79BJXCzKTzRc6Uxo2Mjr54T4kYk0SPLyEAVsj95GfkWvnS7lOubw9H6aK
	 84xPfE0Hj+ftWvwfPHVaaJor8lHJaagBtOeA1wpU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/2] media: mira016 gain model updates
Date: Tue, 24 Nov 2026 17:51:10 +0100
Message-Id: <20261124-mira016-fixes-v1-0-20a7be606268@ideasonboard.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NSw6CMBCGr9LM2iZMMVC4imHRlkHHpKBtMSaEu
 zuKy+9/bpApMWXo1QaJXpx5mQXwpCDc3HwlzaMwmMo0iKbWkZOrsNETvynrIGo3WRPOaEE6j0Q
 /QyqX4eC8+juF8h35JxI9VzkqRwy8y6TDEiOXXvnWBdvi6Ig6GPb9A+pKv16hAAAA
X-Change-ID: 20261123-mira016-fixes-c2619f82c418
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hans@jjverkuil.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V3Ns5IOR0i5BDRm7zRbsioxO8t6rrCaGr/3MepLA5Tw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBrBcCMBVKGl/ChSf1Q7YZSs07VElzmEE5zKqsP3
 7DET53CqdyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCawXAjAAKCRByNAaPFqFW
 PFmhD/0ULzpQXfO3XTCUqTpBVNuLPmwFKAhRB83IIwSG44pvyoOI1BpwOipBF4s9Hhh1aD7LNfN
 Qs205J1cY3ivG4FcBpRnz3WLJZwJWQUNfwRnmpUyqasvacTlZHbZOlW4RXz+wV3fRUxI71p6WzI
 DlAUfPp/uPtty9/NBn+dKhwIt5/x9/EaZ1xoONOKWTs9thnHlId6HSG7lbl2fLJhWUMKpDJTL2w
 UsOLdHkFswgFeNd59b8HDtuzKjIK7GEAHdYuvjyeI0oFR+PkxpgHGRr2ZRKTHkB04LzfhyhRaYJ
 U6bb5NpPCcLNAXW9JpPddP5ekrq9W94rytEwth42i11aZnNiYiPnLQ11oQRw0XGGg2RH9coIdIl
 GnrlIfOm1JzAJinb7VoZEFEss1jxpdRmc590ie2ucHWBNFBAI3v/A+Hp++pwdcHkSluc2h9pD7Y
 9/WBM2Z4ZHo1fhGm0BySxpTCwXtmeOEtj7MphiWGKoH4SVW4kAx+kjFTQ6fq5PMYA5IoUnZTL4f
 eP5SDg1Wg9BZhpbtvv6Jc4tZr/0oxoRbrLaZcmvdyLS2HHazuMtC51bvwRXZuWg7YydNwCkh6kq
 OU0aCSIAQHcmfXNdCjL08u4FPm2Mayh+5CEO4qAZXYA7emjsNFl4mrln4pcBHYhbqIJ/e4BMuz4
 3gSsxNLhmIOR68A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

A few updates for the mira016 driver which just got merged in
media-committers/next at the beginning of the v7.5 cycle.

The bulk of the work is the reworking of the gain handling which was
previously modeled using lookup tables and is now calculated. Thanks
Philippe for the investigation and the effort. This makes the libcamera
integration easier as we can drop tables from the camera helpers there
as well.

I would really like this patch to be collected for 7.5 together with the
driver, so that we don't have one release with the previous index-based
analogue gain interface to maintain compatibility with.

Tested in 8 and 10 bits modes, by applying a manual gain and validating
the actual image brightness changes accordingly.

CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1802703

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Philippe Baetens (2):
      media: mira016: Update the gain model
      media: mira016: Update 8-bit gain init sequences

 drivers/media/i2c/mira016.c | 147 ++++++++++++++++++++++++--------------------
 1 file changed, 81 insertions(+), 66 deletions(-)
---
base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
change-id: 20261123-mira016-fixes-c2619f82c418

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

