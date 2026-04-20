Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93736336889;
	Mon, 20 Apr 2026 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693313; cv=none; b=EA4tLP0c/OHSeLJQAvhx/QrBXu1ury7P74ciKuhXlWvlp9Qct3K9Ly2HFDNfbzyjfzqcO03G0XFI6euz8gv8ahhM4MRNWLdK5LaiTADhqF3g5mQmQFnaJ+bNipsTIF4xLXH9ccWBMookSb27U3S5SiKc5LonloO9+hRTr9nu16g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693313; c=relaxed/simple;
	bh=c0pplHoF2hGPgv76pbdyINiseV/ivxW/spnDFcaNvN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOUn4yWnB47TTdGubs6xgdge33IMSjTrH/vshttUV1aIfXRdDuNFpC2mIjOhvhZ9qJ32TGWs9VPJePxbL7MBclePqKAkXkHJE1yDXawUGn3tJGKUo/YuW8KVA5fY++FEk/zfC7EVmP2vo/trCa0yZ7hp3alHbfg/bcNrctsynkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=nUY94dCH reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="nUY94dCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776693301; bh=c0pplHoF2hGPgv76pbdyINiseV/ivxW/spnDFcaNvN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nUY94dCHU4M7JX/Me2iCaDSSImUYAvT31cBCsv+vipdtCFmVzDhhPJYEDSpK+pEzC
	 l5qpAvuuwZF/dP7fwLQfOKZtthP6gHajle7w66/ZwJKhQ9rWJpu2NNdgEC5HWTAlUw
	 zHAw/9DZ9YbP2JJ5JIIuvqDmTWpXtVESXSN5ZBEsuF5emVRAs3QORYPPhm381ICwFM
	 m6CPw4jbXSE0t6P/TzK40ZdRrO2FXAvpmz1W5Cju6D1UfsiXUd65XOkIg2lquFqD7o
	 BYSdrg4Urfaq0YDlobCMX3h6kKxxSGkfbbtm8rM3KPR1zdXqVS1dNtPSzDBq34+c1o
	 npJKXMN4h8p/A==
Received: from jovis.fritz.box (p200300e277385200d4729014cd58054c.dip0.t-ipconnect.de [IPv6:2003:e2:7738:5200:d472:9014:cd58:54c])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 0012B2206E0C;
	Mon, 20 Apr 2026 15:55:00 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id 8E7687E; Mon, 20 Apr 2026 15:55:00 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: gspca: Handle SENSOR_HV7131R
Date: Mon, 20 Apr 2026 15:54:41 +0200
Message-ID: <cover.1776693140.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776426352.git.pmhahn@pmhahn.de>
References: <cover.1776426352.git.pmhahn@pmhahn.de>
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
v3 -> v2:
- Fix alignment to match open parenthesis
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

