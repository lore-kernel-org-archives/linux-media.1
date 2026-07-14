Received: from o128.p8.mailjet.com (o128.p8.mailjet.com [87.253.233.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ACE35E1AE
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.253.233.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039558; cv=none; b=AfzU5noMC6ybNYAddPptfPiCvU49sfQGqZBF4KMhtosGbAdFd6puUhZeaUF/t9iQPziD5va5YVo3L7NdFmUBlbMO3LSEEi2rpW96hGMV3T+iqzzO9hR9KHlwA3xo7rfSMdfAcNYFiKbVQXLQtLjPFXkyMUq2KRgFr08ea1Cyxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039558; c=relaxed/simple;
	bh=zkgY23z2EpYFIDBMgDBP1604C7K6PurcKcAB1VGSoLc=;
	h=Message-Id:MIME-Version:From:To:Subject:Date:Cc; b=ILmDdlGGJiv5gaZDN3xQuRhgPRDF+oSem1qmXkUo6S8rtoF0dgkHQhkZ0shVMaeXM2G2H7fe1QTo7V+bESO6siHoP0r+3iejrxuPP1LJQUGwshIvZzgdjJKzyo7xigoVqPIxG8x8p6ZigQ1tC8y9GZ7PXShQoiaT5A9Z09jhckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=datapath.co.uk; spf=pass smtp.mailfrom=a1809859.bnc3.mailjet.com; dkim=pass (1024-bit key) header.d=datapath.co.uk header.i=przemek.gajos@datapath.co.uk header.b=nFJy40hv; arc=none smtp.client-ip=87.253.233.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=datapath.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1809859.bnc3.mailjet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=datapath.co.uk header.i=przemek.gajos@datapath.co.uk header.b="nFJy40hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; q=dns/txt;
  d=datapath.co.uk; i=przemek.gajos@datapath.co.uk; s=mailjet; t=1784039554; x=1784046754;
  h=Message-Id: MIME-Version: From: To: Subject: Date:
   List-Unsubscribe: List-Unsubscribe-Post: Cc: Feedback-Id:
   X-CSA-Complaints: X-MJ-Mid: X-MJ-SMTPGUID:
   X-REPORT-ABUSE-TO: Content-Transfer-Encoding: To: From:
   Sender: Subject: Date;
  bh=zkgY23z2EpYFIDBMgDBP1604C7K6PurcKcAB1VGSoLc=;
  b=nFJy40hvMxub+qaicENOiybpeyZc1H1ZnworUD5rpa1E4eHNwR2S5dQiq
 FcenRSoHph9j7UjKELuDCkT8GvUTCpmz4o7fx7lxnEhX4+NK3Y+fvwGHveex
 1x/zQN5aVacAtmhOSlEpYrH6tn+0q0g8yEfLx2P1Vxg3wDpXNew2CM=
Message-Id: <fb3f8857.AVEAAKBfiogAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVkiC@mailjet.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Przemek Gajos <przemek.gajos@datapath.co.uk>
To: linux-media@vger.kernel.org
Subject: [RFC] media: Question about reserving V4L2 UAPI control IDs for
 out-of-tree rgb133 kernel driver
Date: Tue, 14 Jul 2026 15:32:26 +0100
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org
Feedback-Id: 42.1809859.1736069:MJ
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AVEAAKBfiogAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVkiCE9VaXLXzSw2zgc7N13w5_AAafYU
X-MJ-SMTPGUID: 1df59b07-2528-4224-aca3-0358e1d0bb10
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Transfer-Encoding: quoted-printable

Hello,

I maintain the rgb133 V4L2 kernel driver, which is currently out of tree.

The driver historically uses V4L2_CID_PRIVATE_BASE (0x08000000) as the base=
 for its private controls. With the modern V4L2 control framework this is n=
ow rejected, e.g. v4l2_ctrl_new() fails to create such controls under my 7.=
0-based kernel.

I would like to ask whether the media maintainers would accept a request to=
 reserve a dedicated block of custom control IDs in the V4L2 UAPI header (i=
nclude/uapi/linux/v4l2-controls.h) for our driver?
On initial research, I have not found any information about restricting it =
for out of tree drivers.

If this is acceptable in principle, I can prepare a patch for review.

Thank you,
Przemyslaw Gajos
Technical Lead - Embedded
Datapath Ltd
przemek.gajos@datapath.co.uk
=
