Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920725;
	b=WIoqSNN8fGdLZKzV+Ij73bbiFGF0TsYDD8k6XPq7qBt2s418SCmmPm87re4hYmbDePlo
	 uK3iAuGwQYQL7gQTDDyanoD89WPIli3WzGpXht6QO9sKgJh7Z+bAp1UNdu4nNqU0ObXhH
	 J2nkOvIqRTWyfkH27LziqjrQIdwnk0kQ36Aox9tUXkXbA8ktCNItdyLEYnFw3oByxbnkK
	 3Ew5M1UPzOoeKLlEOlEiESSsYs5IgqATq/jlWVrHB4jZFUhSsJTWBD1OOJ5T9JwYDX+EX
	 Li1ofRMf85wtjRZsy0r5lW6nZlWQB7pIKnGuCg3iXcmzy33trxCvhrra5XiKtMSi69g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
	b=VUoLA75/hE8dMaf3XvZPtLg1f3IcYl/xxC7dX/IiwZDM0fEzB4R+NuOfrGEiPO+vjoXk
	 oiol56Fcuu4PY3qJW76ftrJ7eEDDzmtOUUt/Nqf0kI5HdUaV78HiHx3OYVJLBxjGydDq+
	 bXMGHRjxW6v2SrkrNzjl7Uh2Eu/DcLRlf451457UhD2evqmyjjnCqxakBfsj0eGrHlXde
	 b5DRZEwN2Kl9yXoTxZ6y1rFhhgnGQD30KxX7XJtoLZwJRN6HAW/ln68TrcWPcFlZTml1I
	 1aaEC+fdYRtBUc8KjhK631qyBP8CgCBvm5nn9kGxo0yLuN3i88Vm6+iv7Ksz2z7sdBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ixg2FElQ;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A2606A331
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 13:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47A2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ixg2FElQ
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so838096a12.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 05:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920723; x=1795525523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=Ixg2FElQ4K8R/ky9HTvGAJuCEGYJVX7TUpi5oiqcBsN7Ib3dSQlPZFiqoWifByTrV0
         PCB1fdjPoxuSx7k6xU5Xs7JACbWaTU6J65zOLIeWvkRrpgrHEvmv8OR7AC8g6GgagGzZ
         rlAv40uJp38V1S4cuqLdlXuoeTFIFYLtiU93vLGg5jwPGFQSoUNOE+kPZLUGKa6lapxR
         oWokp/R1jGHIF5AJUY9RcuVHCm56TbQriYCRtLKpzW4hOx9oMb5aeeUk60mxs07G+NOb
         re6d/LK/Y6xYh1CxsjDHWxaD3+MG0VabzTA0xd6exotZwAYLSIFMC7ih7BLLdb3e/uK2
         Z68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920723; x=1795525523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=iuKwTfZYRa5ZshaEGzNgakdz6Mju3PwdO1qat2gm/BHPFAxR4z7nc/4PI6SHQTK0le
         tRLMRUymu50h5H7QmLWi9n/mvixGn2jXJhbOf60N3JlrQi8hDqu3DgYClSMTyNMCA6+0
         moNqydILU+ORCWo/oEqWK64jKAZBDKLEmA2YXrkzIBm00UlNvxbTfc4EY9kzLrcXAiM+
         uMuYp+ZfeC7s14L7RdOzAi1U1gorZ8v/Z9xWacVqEiQLEaYnTJS8b2xn3H0VEonhxgFw
         +jEQeH5jUtADmGiNf2IVgoEInq2bkYEkcS1XlJbE8zFo+eJlqK1cAhv1qmcFlIs6OmZ6
         FTPw==
X-Forwarded-Encrypted: i=1; AL+hErEToW65s1Ji9ydCAJs2++p78HSjuzngZApcBIZwdQXDGDhVI9s/dp+Fgq82cCrVfeJAFrf4zNuejJIaDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QPqFixVTrNksAwPq0DlzjcJq4tBmE0q787ppn53ix079vfErv
	uyWZS7TjVsSeBxtAFhUxNcnIsTDRfxHcy+FqYAnGuw/hL3WkzFfgPrcH
X-Gm-Gg: AYBFou3x6Heoqx+qCK9KeLxXeK+h7b/sH9UUcS4oNylfDqVINXa5I40AAoMZW3HDEtI
	1wEuznYkI3LHjIIWkpybT1DJI/Y/3ECVnFBiWfkT4+FN6t1wiQruawfBFUoXx/Swv41HSDH4hsD
	LUClYOcLHgd3DRb1D4AWMxG8YN4+uwHxcBK65mf9/fU3cQUe5E023gehN8DiUXCiERnlBxPC/c8
	icwgdtKEx76EQCNUaZf98t+qROA3QP+rx9ssgF8HrUBmvgjOXUUM7ljYUCdbYUQDBSZVf5kKfXA
	qo18r/c8nDH2kyUIjOX2f6rXC3p2IwzckGGtyu/55nBUsbPZ7mGs8FeBFuYzpASASlyEijEdKdF
	EUkaiZl5BpsR16SUp9h7ENDsG6j6fYsWGb3lRWzdTk7+d/dKDsHiuD/LYPtzgzuW59lgb8wus7z
	6ZoL7ytQ6VtXxthtGhwKtEFg9J0msg6UwW8HAv7zPR/GxvLKl+wpDicOAuDAi/PmTYGwi6txEPU
	NHr77R1iEFbe1gF2vZDzSyRcHATHHvVemSRGaT32o5zzAfjDI95EErtbdqTMWEDRLSCIH7mqCjl
	VGb1QIjDZRGWanOGQ6lTxsvFt191ElX6OfcH1jK2R48rFlRkqwxVqxW8a074xPEFdNrULb4YN+n
	I1ShLChXDZSI4JzhPmlub86DNQ6+2oAPP1fqrATTd3k6pDIKheXxADfrqGUEHNNt5lTA=
X-Received: by 2002:a05:6402:912:b0:6b5:9849:e328 with SMTP id 4fb4d7f45d1cf-6b7c0d12623mr10169278a12.39.1794920722795;
        Tue, 17 Nov 2026 05:05:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b8786f205fsm343922a12.22.2026.11.17.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:05:22 -0800 (PST)
Date: Tue, 17 Nov 2026 16:05:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: atomisp: remove unused functions
Message-ID: <avxRDgUd-uygzKot@stanley.mountain>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

