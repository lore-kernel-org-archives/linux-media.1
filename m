Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B91B366074;
	Fri, 17 Apr 2026 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427535; cv=none; b=c5pPLvi56KYlANlOzluyGQd8do9vDX97AddgFzRBclrIwYSNaQuyp7MvMVVjoZTl9xa4ryDn8AUXvsiDUurE5S1Fd78CKru0nKjCEI4n1oekBJQraMWFys+NlvwacKB8FeI6PK7zxEqAamOvR/RR41MPGk0n3Q93ConsvFG5yxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427535; c=relaxed/simple;
	bh=LthW74V8MHOfLTkITEeOwoQRK9NDcS8k4tmeAMOwSko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sj9oHtJHydP1N0omVc6ilkjn/Mcw9M6lshFddfK0Mizy1klHP1A1mBI0AZN1lqIg7excyuh5AP3yM+BoZHHBLgGOPt0/28+VFr0re0JsuNXSyRluASR8jrcxflO72S1aUXWJ2Mh+/jl+goESVxy7gEqD1FHmzLtnUwM3IEVZew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=JCOubrLG reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="JCOubrLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776427523; bh=LthW74V8MHOfLTkITEeOwoQRK9NDcS8k4tmeAMOwSko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCOubrLGvdWvY0vokGklma+ZdlR+K5BdwUpnAN1Ad0GHxD2qcW1cHA3aANquHGNv8
	 lvfok6xw18m4dwbFcCBy+zvc0y8Vg0ioF8R3JvdP9QLUAk5ZtCZwah1GtjzwyKQQav
	 EUFa1vOZBcdvR19Dx36R4FU878BU9Ll9OUSIXayrY/ieBkPjRUytxIaUgLCnT/JxVE
	 4FfPulM7RVWdX+TfstRbj7XMRQkGE8Rybxawte/nhOQh0GAKitxcOPSOnbEaWvrOY4
	 apZh+WolG3ZpZAmhjL/yemTzqllAqkbV/xPjiKAxBNwcdpuGaQ18d598FcSm/OpOQQ
	 ic5Aiouhw7NaQ==
Received: from jovis.fritz.box (p54909809.dip0.t-ipconnect.de [84.144.152.9])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 8241822057F8;
	Fri, 17 Apr 2026 14:05:23 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id 27DA67E; Fri, 17 Apr 2026 14:05:23 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: gspca: Handle SENSOR_HV7131R
Date: Fri, 17 Apr 2026 14:05:06 +0200
Message-ID: <cover.1776426352.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776323993.git.pmhahn@pmhahn.de>
References: <cover.1776323993.git.pmhahn@pmhahn.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I found an old USB webcam 0c45:602d Microdia VideoCAM ExpressII.
`vlc` triggeres two OOPS as soon as I open the device.

The first patch prevents those OOPSes, while the 2nd fixes a minor spelling
mistake.

The camera still does not work and I get the following error:
> sonixb 1-3:1.0: i2c error writing c0 11 31 38 2a 2e 00 10

I'm still investigating the old driver sn9c102_hv7131r.c from [1], but so far
was unable to make progress. So feel free to apply this now. Thank you.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c0e11a2a24db782341f456877d19b9390c5998a9

---
v1 -> v2:
- Use __func__ instead of hard-coding the function name
- Break long code lines over 100 character long
- Break long commit message lines over 72 character long

Philipp Matthias Hahn (2):
  media: gspca: Handle SENSOR_HV7131R
  media: gspca: Fix comment in sd_init()

 drivers/media/usb/gspca/sonixb.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.47.3

