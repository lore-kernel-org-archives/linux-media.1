Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609462;
	b=E9x0p1wRHUXf7I/KEpqWyKAwheMfJFTzRq/XuZ1omswWwPVK4Hwm4QSnvtPEwiF5KNyF
	 5StV450CjlWYWImifKHhJ0Agh12MZgGkLHcgvi0Tj0OHIZrXuXOoFoxZAelQmKdBWIIH9
	 IqhUFfuvKpW0dgOCOMHtjch1i5m5SEgdrevND9/C/G3ZhjK6Qh7RMohqiXI2YnqsI6Btu
	 5YNAz8DmLGR2hGaRqqfi+xgyiv+9gpeZLE4/EiyqdedEFpROwM75RxpLtXHSUWslnHHR6
	 yGOVeIiFJma4UMY0b6ZoqkPnXokvjNGpIkvHedszmykKd8GE21wnfF54uex/sOdj7/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wLTGWrelj0c+idk0yjSFfSru2jjojEzphFxpTttWZi4=;
	b=Px8q/t62stmpJ7FZxqPpFafvtBy9SyK2FqMhJb3RFMUVNTzFaoPxY4aREua3NLGkNfpr
	 XGix7mfG5sCReaKuvJInc9Z11Cl+zVVh4Dd5dLwz0+d5iRpdy2irEqLG8zzxeA1bK00TK
	 iDg9p+upHEnYve2BCIBGSxFJGatAKrVVCsPeqQlE6WTD6QYe7LK25ny6AyE5yd0pdvjy4
	 XinSZjB7sybvKZ7Qwx0AXnrXey5PKLj1My+mryDKYKfSiyGLcFXck1SQXc2LTCuCQ6+Er
	 rlVZQDlUW8q1ttNUpMGrRblAHvkHM7aCyjeP9oAjM+RDrpRJRgATdC0zWJJS92hcT6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f06gEVEp;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D737606A54B
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 22:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D737606A54B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f06gEVEp
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f563d1c6so905154f8f.3
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 14:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794609460; x=1795214260; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLTGWrelj0c+idk0yjSFfSru2jjojEzphFxpTttWZi4=;
        b=f06gEVEpf+nIUPLzxBn00CD8mQo78Sn4ieaSM83+IvSkhkebdmCp7jkfx3Tw6wk/SF
         ZsHnMWRDyCbgPtfQQaLEf+YjZ02KcCFawqZqR5uQyRtZ0Js6sBrLjQRYCTuavnTqN17z
         /zZXVF3mO3w706c7IMisnauLDaJR1fee9589GDBa3RnORJ7YT8IKlD40vHhkx7PI5FUp
         5pIgIUCQBEZ4uanEbIup7z9Xnjvja/CM2RUrUT3jKUFHAvA/moU2/iAmYicv1OQpDSmd
         cmioUi3Qu/pMYNA+/eZw3tagxA3pkIZKTciTs2fc04lFPTGNEvUpDz08qZZUQutQ2HQt
         PrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609460; x=1795214260;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLTGWrelj0c+idk0yjSFfSru2jjojEzphFxpTttWZi4=;
        b=10JxUuDJt1jKBDafaCGONlzIJQKsKoLAX3JJX1sYhdxTB5zcdPWJ89gF9a3RJRv8yz
         Rr9EA+z93E00ZWUARuCv4YRZC5hwPP77gv7/1C9RvaRlO/e1Q3j9w1VoThnyHEggtT57
         iDBYiKNn6OcO8zx/tMp5ToAygDrJajtFzU3FS8egv8QB6lLuYbxxQA4p5IaG8CwJTtIh
         na1ikLSg8cEhYkArYpqlDq2vFLg6hazL/BDoyHWlY8eGytYoukA85NVFxGF5kPs7zwZs
         M3GSp0LCeaMMTWRWI4LJo75hAypQTHNiQ/yWDWCQeMFRMF62HDv+OGldZ5tIAV+RT5ek
         RH2w==
X-Forwarded-Encrypted: i=1; AL+hErEbelkTB36WbVveehJrnnGfFkj2G4Hy0hFf4t/iLVd+eDgn+tPdoG/Ql4PCVgB5hBgXk+8MbAdf6oYbPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9mN1dLXzI91V1bEWieoqh84anSgI6LRzJb+oNtgVRS531/n3/V
	ua55no1s5uOKTe7uXoshs/LKE+zqSfhUj2ictEgVYjygWB5CP86GQBw=
X-Gm-Gg: AYBFou2iCMZHEvFySdPWMWnfb4dDJ4MucPWbYT80NHIECc1ueGULNGYk9ji9RLLabrB
	0SW3mdvhIdm6L2saImoJFFgh1Bz6dsnn7wopaS4JpHOOL5tvVnzH/8M7fHEy4uoYg3Q4T2F179P
	HTmrKqaniPCJTCh6SpV/Dy4laXQMBNCmLChJ+Lib+H3uTxwWpg+L8BC3410HgwHDxdq3Li2Brjq
	6m7g1pzBZcWI6EUoSDaEK3Sk/SS4UOdeRG6+f2HQfn4Yeupj8UFLrW0ohr9rB24ok+2GeSDCXS0
	Qf2sjOfG4KpKldhramb2ppsC+IMY5kjn6FsRlXUXwIYEVIgkDTU/LAVpFKsg6QDJXW3gB4gVX+F
	BpIWd0OeKQY6eS4K7//QOxdEBHUvpXUbpXDWANudF00cyBZz1wzLFTCuIdR555ORC1BAC0gfIyw
	kLwLQ48dR0Jkt1RHV12AGwly49sM9uAcCB1NbJsNNVireYniPejRdxfCwBFut3trkD3xymHrOW9
	n3fc9DyvpioL5jCxevBN+AsIL0wacVPXySomKGLEuAOMvXvH8eVMxyRT/CUN+6rBWSRp9o=
X-Received: by 2002:a05:6000:144d:b0:492:880f:494e with SMTP id ffacd0b85a97d-49c72c9c630mr9017132f8f.40.1794609460266;
        Fri, 13 Nov 2026 14:37:40 -0800 (PST)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm12122696f8f.44.2026.11.13.14.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:37:39 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: hverkuil+cisco@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 nicolas.dufresne@collabora.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 media] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Fri, 13 Nov 2026 22:37:39 -0000
Message-ID: <179460945963.2677875.8420657163527602501@gmail.com>
In-Reply-To: <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
References: <20261104014248.3761373-1-tristan@talencesecurity.com>
 <a931e754-ab4e-42d8-8555-9a432fe42a1e@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

From: Tristan Madani <tristan@talencesecurity.com>

On Thu, 12 Nov 2026 at 08:38, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
> This email differs from your gmail address. Which is correct?

tristan@talencesecurity.com is the correct one. I use tristmd@gmail.com
only as SMTP relay for sending.

Thanks,
Tristan
