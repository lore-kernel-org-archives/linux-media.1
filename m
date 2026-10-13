Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748974F7975
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894743; cv=none; b=JAuEvMzQEWkkvoZUt7bjOhNjsLtIxJ1Img+mMTk015rW+5gP8+XHqAK3NkvPlFQCpWIw6bNEsWjpwuD5jax6ZqcvAIG8n4u09B/XQ8T9VpQ5ry+1apKNW8ghBL+LvzMV666dGTemzMNHI2LYSHbIpJmlOimjV58TeHOKoR3pSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894743; c=relaxed/simple;
	bh=r1I+/dUgXdXoKXx3z+8GTM3jiTR6PaexHOsBVmIF1fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVEuEXlTZWNu9fviiCDINTJ5h8NR20bFTApq7lEp1cV6ZZfzWIzgfL77dppFmPjVzlsQ9ES4RJoD1ZAzO5z6uDuQgYd5rKaqy/MD9RIwphWeU5vgeerbNWQx+oAy6wt6zakCm10bd0GU7WRfrq5xKvg/D/gfxxHAEmOStllWeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=INTlmjeH; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="INTlmjeH"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e6fb35f91so287107885a.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791894740; x=1792499540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1I+/dUgXdXoKXx3z+8GTM3jiTR6PaexHOsBVmIF1fE=;
        b=INTlmjeHEMcGqVI3/TUa02j2O+A6HTw3pSnAbl8YOa4VI7rFWh+Kaaf6IiRlFFcykU
         hmPmjBEczKj9Pfn5wiBw7m2+LEWOKBXCbqMb6Lfbx6GnPAa9eAEMFupkdLDHfkmfD5Vf
         t8wIdbm9fzNuxohqh6P1XELvtOun1BmM5QFEUDJQ94qVp8gREoqKvTYFGNv9qIz64MCJ
         o+zMAbzzX0Rsp0FOBS7txUWqm/lL6McsO+9cNYC8rFqiC/7FxhzpsDx3xsRYQC2vHuVh
         Gbz5SOKbYBrBgOIAt0FAko/vaA7ghb/VjRa6h7wegOEZ14yDuoookuYjup24DlHac6eP
         u/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894740; x=1792499540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1I+/dUgXdXoKXx3z+8GTM3jiTR6PaexHOsBVmIF1fE=;
        b=x+K050y1bWeBGHjkSLJpRMzHm/JH6lCWMRLIpmX6TXl+6HHaNk8aLShNGtN2OCKhr2
         Lto6kjyxDCZ9JmhDn1uDXp8geGH2q7ecVNTfIkURTbqlmVhxSMaiIAL3Imm96nBX/xyq
         kHyFhjsbhta5tUfF+ZciBD44Ygn+TFEI0Q87JtIcbqprwXKpSqYPZMdqWDB4nmxQ5rgv
         CPIfM8Dz2HWI8M8m3w6sOK+WtCvlVhU4QotRlVbV/B52CjV5VxnjGLvpNKfVomqyk6ZO
         BTTgDiVOKhHriHJqqDZrbw0PyxD8QKMjifNbtdFlgA6JOcxxhDOi7+rOgEfqRk9DGZ4R
         xNEA==
X-Forwarded-Encrypted: i=1; AKwUvBzYj0tbFUEqo6d8XJ6bIgrkjmkFAaWPfWAWOaOtoD5w+KljgvzMwTmZBOPhZESF9fQ8GN1jy61KcQkh3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIiBBePxIS/v0b+br4Ee60OYY1EVKTom5+zLdlt4UyMW5TNgURu
	l7AQVDbvdEhqQoXxbGuqrzW6o3U0FWHgthXdKgCERin/DaxxJymuLWYlmdInizZFPWI=
X-Gm-Gg: AYBFou3T+o2MEgGJLszHyIZRxTTXmF5GVYtMkmi4x8JrpTbJ0HHah9btMUSG/s9N2s4
	dfQAvopu4+C4hK7CMtsiSaECLzVj7yRPa96toSVLfV5245+mPgbg5eaidcB3lfauxto3XRSdSK6
	tBDlczql1sv2YFAp3Mqvz0DyX6sm+CnEmXJVdvWOMLflE75X/CqeBfwp93SlqpQitf3qw6JSPqZ
	rGynKir7rYsbCGlyDYEL5hy97W1SsPLYaJWnuupJFdDLCJOcYRpRlAwawE4Ug05S/hrXWcPi7re
	bSFhjO1N5D6q2Msqdp/JY8MO5K3TFVbVMp3wgNC9E71+PBvgL/SXNzZEOPmSdAkIQXbqPVFoRiH
	c2QRdCeUPcHvfJvTfSC6LCPOXm9vdjFUBop2jRbbfHJAoNbiDRbNc5hHe8JBQrHC2bER0F6Ti2I
	ppyIkpzDVorFMQ3MKCfCW3Odl6ICEqtdILG4oebMTMGpF5+GZ1v7VVFeF/jb6WZKuhkEDlNtMU4
	jpmTRFjYKIv6Nw6MpPvCqVHVk4pj42f7gEju+JDp/FyQp5iFW+kvso+jT/60/OnVYT0tZZQ/en3
	dwrWF56gmNETHVeJ2oZIijBwsmsUX1xlEoptoWFiWosZIEU9Lxwc
X-Received: by 2002:a05:620a:601b:b0:93e:6a4b:3ea6 with SMTP id af79cd13be357-93ebd1de502mr1974484885a.24.1791894740177;
        Tue, 13 Oct 2026 05:32:20 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef502608bsm226220585a.25.2026.10.13.05.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:32:19 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] media: ipu6: Don't require an ISYS reset after stream stop on IPU7
Date: Tue, 13 Oct 2026 08:32:17 -0400
Message-ID: <20261013123217.17680-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013005048.8601-1-j@metarealtyinc.ca>
References: <20261013005048.8601-1-j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CI build failure is a base mismatch. The Fixes: tag made it build on
the fixes branch, which has no IPU7 support and no IS_IPU7(). The patch
is for next, where it builds and was tested.

Jake
