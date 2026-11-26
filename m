Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657000;
	b=0ThxjbIm7pZChcu9MZreRibO76u6vX1U1f0zWpqd7LGPtmxczz6lQXSCmvWItdWVPuiE
	 1gM2nQm56SNyRw6KLxx2j9DD8Ydy+5w+2hq91pbjbajuuEzYPqmXnip5Xq3piMYhcTcv+
	 uk3UMMbrx3V9eMoIjzOLV1mgNay3204S1xlE8wuJ9VCjrjvm0r2lwtfFvwIDMDuR0VUrt
	 6ijlB7iCOx8NLNPbTRglG6Vj0gHD6S68EwBf8LIHsG8qjbAoB4y6mEDJwCtjdw01MjPf1
	 LC9a+RKlHWJ3pbY/wxLpawV1GUvirNsu3TENnfglqntT3T3u4HT43oKJPbwylces9oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657000;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DpPR4Lgudy4Xn24waxb/0v4e1jw2nsNC4nh9F+XHgf4=;
	b=vEXtsvqHN9d9WNUlMyg4qJVLSqHIPm3KxsMVupvKOEiUAgYfdocdtWY768k5IyUtN5YX
	 DT/eoa1nwi2YhU/pQw5aaw0+EW7RyWYOQzJ/+khE4Y42Nql9zBKieMIzfdnzR0y+M8+tU
	 2QwY9PNny75N4rPPsK9TLsgMIezU1I76Dff7IIzrSDWN4c2sunTgV1gTsfj6zyxt90dHa
	 qtFSZTFh7nWlE91C5SjBo6aCEiaadeHzqGoi4Y2TTxF5vcK3SzQCeN84myz2h25Yr0mX4
	 XlPCVMNEjJCAJDc6skWgQn0gHDpVbmQqjvdvPVGNm/CWeD4P60GfEIZmyyVy79Qk0bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=innora.ai;
	spf=pass smtp.mailfrom=innora.ai;
	dkim=pass header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=je4hLDKD;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B02606A323
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 01:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=je4hLDKD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail3; t=1795656997; x=1795916197;
	bh=DpPR4Lgudy4Xn24waxb/0v4e1jw2nsNC4nh9F+XHgf4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=je4hLDKDtTJ7UfwAh5rXTWOykyeXGhmvrV6vgCexebLRz+SvVCCd/K88omVptlSEv
	 WTkCUte3O8B22JCEm8UURGXraRq2/QmSVcJ4iDarsiIi49gtjOqCoMy9qIuWOo3S01
	 Zd0i6F8vHIcRA/s6qh0I/3ikjI/i6fksBBs5Y4U3wf6D49uXseLE9PlWBFaB2y80B/
	 Hbhq6x4VH6u/nwgzwSW2uG5UpIEFJRnebToRyNen40ASCorFiHTLzX0PFfvTIpL/l/
	 3amIj2k84AvEVtiXF/l1iMej6mahU84Us8h4HE67x3/qCcu/TVgMXu3JOLtcfUJvt4
	 0eDyf+4L8OB3w==
Date: Thu, 26 Nov 2026 01:36:34 +0000
To: linux-media@vger.kernel.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: media: atomisp: don't free the current DVS 6-axis table on error
Message-ID: <20261126013631.53654-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 18dac58aad0ed82082464985013203f839a7f7a0
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

When the new DVS 6-axis config has the same dimensions as the current
one, atomisp_cp_dvs_6axis_config() reuses css_param->dvs_6axis instead
of allocating a new table.  If one of the following copies fails, the
error path frees that table while css_param->dvs_6axis still points to
it.

atomisp_set_parameters() handles the error by calling
atomisp_free_css_parameters() on the same css_param, which frees
css_param->dvs_6axis a second time.

Only free the table on error if it was allocated by this call, and
leave the current table to its owner.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Feng Ning <feng@innora.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/stag=
ing/media/atomisp/pci/atomisp_cmd.c
index e66a7d1..afc7dc5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2718,7 +2718,7 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_de=
vice *asd,
 =09return 0;
=20
 error:
-=09if (dvs_6axis_config)
+=09if (dvs_6axis_config && dvs_6axis_config !=3D css_param->dvs_6axis)
 =09=09ia_css_dvs2_6axis_config_free(dvs_6axis_config);
 =09return ret;
 }
--=20
2.55.0


