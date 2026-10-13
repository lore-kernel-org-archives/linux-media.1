Received: from e234-52.smtp-out.ap-northeast-1.amazonses.com (e234-52.smtp-out.ap-northeast-1.amazonses.com [23.251.234.52])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0003D9524
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860103; cv=none; b=qJ32Bl9snwUQInrmkI/BWSwN5GsuPCsdLVAPnp7EVbzjB9Fg9IXlj48agazQfLF3fJV2BOFMqNXEM0n4SvQ9RTkJQb7U58FWLs7Ir9UQiZiftQvq6h23UXpz7kFbdb+S3fwiGNDiDM7M4drdJe5TpShcdeOrGLaHGrz/dROLMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860103; c=relaxed/simple;
	bh=9OwQi6sDwQVzp48PsSHMXl4sHvTZx3PhMZ6Bt5r+c1M=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=XJegElR2PuU/0RujKjyABtCiqcaG7syPbmJ1yLTrYf7PjUqzLuau8SAVrBSyTiEJEl+ZGtvvchuv/te1Q7h0h52sm+zJ7gUvrutL2M/m/Pz5VAEUg5m3KHeJPMutAllrMjhdFrt0+dkv1/S0d5Buayxg+x+d/7jzgyGw4YpnmFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=1KW/JPCN; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=BOsu/sVd; arc=none smtp.client-ip=23.251.234.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="1KW/JPCN";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="BOsu/sVd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791860101;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=9OwQi6sDwQVzp48PsSHMXl4sHvTZx3PhMZ6Bt5r+c1M=;
	b=1KW/JPCNkg43QJ9i1BsHs1uR4iTZ1UxwDwCsvIkcB54P4vXvzIJALRMZEF0K/3cK
	PHXwG9hYxW6e55jrqvCwh/I8/ETGiCn6iHakUrh6kkGmKSBAlaENqeI5d+Vq3NjBd//
	v6cCtnAj1EWA1MNPACRfaQVMXXVWLE7NTdgIOs9A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791860101;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=9OwQi6sDwQVzp48PsSHMXl4sHvTZx3PhMZ6Bt5r+c1M=;
	b=BOsu/sVdPNomcpTW+8f9rzA+3I+dQ2Nir/r9Xiz5qWRbV2ZNLJpBfntMZIM2q3vW
	uovePo2LvG4IJLO+O/rQkL2DGYj9KGVXGFuyOEU4SaopxgFroHOLFjBJF/1OKeIH/Uq
	PZorbfd+UJZbx4B6V4jWgVYluR11GK8bb0NDop6I=
In-Reply-To: <6aca088f.a3c0497f.3c6821.df4f@mx.google.com>
References: <6aca088f.a3c0497f.3c6821.df4f@mx.google.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: pm@petermarshall.ca, patchwork@media-ci.org
Cc: media-ci@linuxtv.org, linux-media@vger.kernel.org, 
	benjamin.mugnier@foss.st.com, sakari.ailus@linux.intel.com
Subject: Re: media: i2c: vd55g1: correct VD55G0 register access widths
Message-ID: <010601a1332f4eaa-5932b837-0115-450a-8e70-a84086c38df4-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Tue, 13 Oct 2026 02:55:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.13-23.251.234.52

Hi Peter and Media CI team,

This patch is an incremental fix for Peter's unmerged VD55G0 support:
https://lore.kernel.org/all/20260918221832.323751-2-pm@petermarshall.ca/

The failing hunk changes vd55g0_reg_map, which is introduced by that
series and is not yet present in media-next or fixes. I rechecked the
patch against Peter's vd55g0-camera-support-v2-9 (4a04accd5f68) and
v2-8-on-master (b42bede8bce8); it applies to both. The three register
widths remain unchanged there as of 12 October.

The next revision includes explicit base/prerequisite patch IDs. The
dependency is still required; those tags do not make it a standalone
patch against media-next. Please evaluate it with the prerequisite
VD55G0 changes applied.

Best regards,
Jizhou Tong
