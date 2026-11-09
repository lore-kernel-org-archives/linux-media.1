Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242583;
	b=eedjX0wu82eLczWLHHgHymdl+5teugq6eV3OCmDmRPyEr8Qm7r22szG00Mhtsuo1lbji
	 FwauBlUvzEUWvcf2YulJYAGBER2Hf2MosTE7UcubHh43EJyhnPzltXUYJEBZzOspCOcvA
	 L9gdV5oZggBLKTJis+jITLPMwuXaGdFAUqZdSOsnJxKSVMA+R5LxWxXKhsTg0pgFoS8vE
	 sBJVji1gppZmd6duwRMK1o98yQbGMvf/Dkxa//1CF9cQlhhhhwrUmmggnVbbAP3vBaJwW
	 thvv2kAd41/gBr7+OekzhXNc8nbadNO+7mLk8gnBD/7z1AGiM4hDR5Eqfb3SWZ/HqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
	b=j48xXB+ylyd3NczaokXnDlCw6zxbkcsDywcy9qwNZLicL6iUU3rvq3TVvDpDOB8lI983
	 UTHpQwdSKgTrDyxoBbvbpHo7klGLDE8g7XcfvmnMFh7vmY29De9T9gv+7vOcDvafjQwh+
	 AqurBLHUL5SP7wNOpn78BhgPuVGhmmbWA/MFN6QyOLsDIJXy23Km043s1BGBo8r9izLdd
	 yu1TwqdW3CmPS76s29TlhQL+7hUsL1UPfgZL39ARtFycXBrSGQTdIFjeNMb/ON5OFDY8g
	 y3lgfDQ8cYGW+iXlucChL/tvYWc4wIkyHbt2YYcaAR4+2WgfMZC7+gtMSe65q+za2GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXCBCBHs;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4AE606A326
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 16:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXCBCBHs
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso7637195e9.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242582; x=1794847382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
        b=SXCBCBHsSo1J3DlH0uGTefaGDiNWDaEN/fnhbLD8gFE+j797GgHng4PCUXhmlz/IwZ
         Xzf0cqS65Wz1nm33DkPDkGlAXzU2rNlNPHnuqPrtbCo099yQIwByXzcd3gRqQuJMAXtC
         fKjKxOq/AX/4sfUdAzFjkNSA63Vlp5t2SJgU87Ei8z7TbTIwnaQFq2AdCrXQB1H8T6O3
         1Fq6Jeau9PjXj8VsM3fc7CDDERRxqAAQUpPqX3ueemsIE+SgEYpSj/WHycpoeb5qGBOF
         hMAWXtj6H0FIFhuLJZwLzGcchMW936rAoYj6P/6MEEkCtXEfAIYwVYljth/8G9HcYpff
         7dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242582; x=1794847382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
        b=yYAUaN+bDq6J3I/wAAaHth3SpR0/dcp3q9m6LzSwGs2RqoG1BKi0uO/pwPpY3pVvWi
         F7GD6nrP8vsjRWRVgfxQoGq/smYyWkB0ojlnzld6cTIKk/l11tJRPK8GfM7+lrbOC2Kz
         ETxI+2gJhUsK+ssK1RNQISEb7EeZqlhxAuXIrJMjXhVrXHTED2pZckMloxNJIErzilFC
         Soy/8slKH/ExZunVD3v+KHkYFExyUYNogZHF4lLPg/lftU/2wmzcqJxiYsvk18QUS1zN
         rpo/6DoYv3j01bX5VKINtKsR1wBt+XteBaKVFBrbBbWItT/ZnAJEqgFroRbEFFDXV/Uk
         uqqg==
X-Forwarded-Encrypted: i=1; AL+hErH02GqFUgW6BwcoDhDle1sZDI3QLP16hEz7y2Ts30xUmwfJHRzZmpd2F5Fu8wRFEE+UYcPPgY4UoMA47A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8C8vUJaF598xWNq+3bZb+m9wZRs+KVSW/lLQ2KPCwzCSHwN8hK
	n+ZE0VctQFBqFfHmhd8LDtqufrO4r1ikFy/XE6uo0jFg27HoTW5EZCk=
X-Gm-Gg: AYBFou0hLvQR1O2RtBh98NpwcZ2xaS+t+XxwZdjrpuh/qfcOp/4H9pg1XvSG+eq5i7v
	G2WD/pdzhv31b1DjNW9f6Yv3q5EWXs6OH4jPQJbYTWkJh9408G3lIcleet2ccqciBKzcHVgCocX
	9A8F2h4g/Y1XEQDfnjxM5USR2L2jNSgMFSWxZNvCmzGLdzkJq5/1jrCCn7SKExzC429QPj+BWkV
	kCAGtQKhqd13kaQa07beBJInsRcWsZN2O59wqNMXzYwONtTHseNE1Do/Ju/3pAQAO61rKk7KMzg
	220yebwu6JZA44naQAEDMv5IGsGQs7zpWXh0MY2X88kxIHCGugCfC8AXXj/pZ2berNLnHZLr1jB
	fdsn+VWziq62djzCA/w0I4SnT1dNAESrcjVm5HLF1ISiiR90tJ8F7iJa/GfUCyCVfPotbP4irCk
	WSwQD/8ZGI6ftl5EBwa1uX2EnM6nsAmjpnGqd/UJELb7Zn6s1tclOJUOEPhc06YdIXNKJQ8IPhn
	ADUj9Kq7TcH7oOlMVxDR6PqNex471qETBQlazLpwan5phzfo+G3ys6bSQ4rsgvIa9cywx9iiX7P
	KRG97wXVXosSljgUBiKuQw/eckufPpTbxYiHGm7p1VvtVPIkPw9sWdUWpryp3icSzI8dMiVGSFL
	m3CYO/ow/zo+Vi+AWm1vK2QmZX7Xl6ZLpmvBtlP3zbXqwJqOYwX59hCREHuZuRZV6yyZS9pk7RQ
	==
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4b960d9c486mr96080385e9.5.1794242581971;
        Mon, 09 Nov 2026 08:43:01 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm441798645e9.11.2026.11.09.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:43:01 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arpith Alexander <arpith99@gmail.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ipu-bridge: HM1092 entry hides IVSC-attached OV02C10 on Dell XPS 16 9640
Date: Mon,  9 Nov 2026 16:42:49 +0000
Message-ID: <regression-followup.20261109163952.eaa256f0cc02@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
References: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I won't send the patch I mentioned: Arpith Alexander already posted the
same change on November 4, and I've replied there with my Tested-by:
https://lore.kernel.org/r/20261103200226.100989-1-arpith99@gmail.com/

A correction to the revert option: there is no HM1092 driver in
mainline or linux-next yet, but one is under review on this list,
including ACPI enumeration for HIMX1092:
https://lore.kernel.org/r/20261106121907.42745-1-j@metarealtyinc.ca/

#regzbot monitor: https://lore.kernel.org/all/20261103200226.100989-1-arpith99@gmail.com/
#regzbot fix: media: ivsc: csi: Add sensor node in bound callback

Thanks,
Sergey
