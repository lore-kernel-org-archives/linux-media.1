Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A5C1514F8
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075423; cv=none; b=O/iZarloKviz43wFwF+C9RRjFr3DTY1MwskLJ90TYNt/IgMar1zGPJP0iuljM74EfosrQo7cKqFSu9HxOvC3FVUqQx9hhcwlCq0xq/2YZFnOVRJR5Xcn/w8qRyGeqV5yTDg7Ax5hxUlUN/h1ds0wEfQzvM5RlUru2lNvBen/mFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075423; c=relaxed/simple;
	bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Nj+DnW4DG6DGWRDI244qIUR/L3qSWk6gpAb+gELjmklWu1maU2jbLCaqAxFM5u+7jlG9Di3FZHWQHBfcHl2VZ0r+2JkRL9cSCNvqPZDWSY+OnvFxdDhj7Jv3UkZIhIIz01nIOHuPpuBXSGTGnXWDeVFJ2TY0t1qDGH/XBf4uEq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFPpli9U; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFPpli9U"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6d28aa26cso16835485ad.2
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 00:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075420; x=1788680220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
        b=eFPpli9U0E+KxnlfNhF/6Io7KcyzbXzny3HXdFsAEcjFuAMKz5F29B1mtMGwMolnvc
         bpSQrWd4IDAzd8tnOkYlomWNj/Qb4TUxqlD4/A1iZfZXO3DuobAEhSNUBjwjtFiDMqVe
         qR/9wFhUxQ72lsQAsORWa01l/XKSMXG0oclFCgX+NLTdIs+Q+Hi4iRKugGfz08hn6kwc
         +ona0Ip+Xbl12oo48NKiFZIdJKwwOramcCieOhnuR0+hsrNYWCgmUvbWTe6Y/9Y0eLr2
         LYX4mzXy5eELgOSMc8KvJcGHtPfH4MbLdXOOoduFn8kg6a+8KciQOHzD5Aaq6uXimBFo
         nOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075420; x=1788680220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
        b=KIwKO3y8aNSI/HX1W70PQeA0P42M7k0nlEomRIqzarebEvNQFfimEUiWzrs+k7KcmD
         YGi+5WVQqdMDSHS8vbAAEAVMvq6cJY+PnFTWIHxprvo2b9rQpRhzN3RXroZy5QCFOk2K
         AaaV/Yxxrwa02D2qW6T9WWCqcH/eZ6LEUdtd55uycrYCnOC7kuXP471AEb4gh1bZ1iDt
         UWnr4WWDrzf0ZuzVlZTFKU0p/Vtm1BVwWX8U4EDBhKOtLK+zR2D7KZd/3grDUPTomxDt
         lJqmzVAUuBQ/UBDEMBpaHfAMJ2+x38qKyqoi0J+ZrC4aeTBbw05P3Fk5A34CKMuz7S0P
         hCNw==
X-Forwarded-Encrypted: i=1; AKwUvBwDIfmg/EepIKL5AOgtr9zBODjPDMJev7u8NAF2JIa+Cb0+QAHcx192uqE1ilUqjgVa6ThSxqlxvRe6Ow==@vger.kernel.org
X-Gm-Message-State: AFuF++lvkQp+ipAyql5CLUjdB4D54kQCFoxzZC41xD+A0Wkq9UqES1pm
	zaOS40EaoX4kGf659H5GAkuxIB4IoubTS1kVrZ0XEVRoyE+3hZeXvaBfaGMeGN7xADM=
X-Gm-Gg: AYBFou19DXYIdYmwmqgI39wClbj3AP5QttiOg5xxlrm66wItwkCKqrImmYWlEulm4SS
	XSWZQTf3igZMtH6JreHXGoiNtT7VA8dVbMPz1htiannAv8dCA5fLD3SqAIDugrBF3Hv0V0hIeLX
	d6hJaY3TDgpf3VxVOVLs/5811UgzGEODPHumVhHuAa1KbIVyNpUE6XUBHpPeCE/serTggMzI6js
	vh/KY6u2RaIadTEdfq2IdCrL9NDkNQqGI705n96h9BTFFFqyS+hoqCSYRhQ5w2r+Ys8oVzz/Jo5
	Tht+T8lWOPCIM8efBJypUSU/cfaJMT/7Rx7i079M/abZA+XYpygQU1u6glOohVbGdHcaPk+3BSI
	1EJ1WcE/2weGE4ADPn9nMyx0MrxsCsTrgo3nsrlpIK/wQNCCKaKdyfqEjuPf1TfTddWzGF/gV2d
	MDqhZdpmyfC4ldnp865PJb1MA2od91ScpoB2zqq5WjnAuxhXETL5v3MdexIrJT40z7QmU+hYoGN
	AsW0blmKzJnlfKARNCqcbX51Z3DDcC3NepLG73C/rk=
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr332620145ad.12.1788075420167;
        Sun, 30 Aug 2026 00:37:00 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm25390894eec.16.2026.08.30.00.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 00:36:59 -0700 (PDT)
Message-ID: <037b393f-4b8b-41d5-8a88-e0d4c2e28416@gmail.com>
Date: Sun, 30 Aug 2026 00:36:58 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+muzafferkadir.mainlining.org@kernel.org
Cc: git@luigi311.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, megi@xff.cz,
 muzafferkadir@mainlining.org, pavel@ucw.cz, phone-devel@vger.kernel.org,
 sakari.ailus@linux.intel.com, tomm.merciai@gmail.com
References: <20260829-imx258-add-reset-gpio-patch-v2-1-bfd27891e225@mainlining.org>
Subject: Re: [PATCH v2 1/2] media: i2c: imx258: Add wait after enabling
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-1-bfd27891e225@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Great series! Enables the back camera on my Pinephone Pro.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>

