Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB551B4F09
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 06:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792218334; cv=pass; b=O/UkipPnkLNeYvF9cw2O+WX29U2rbw5uCRdWKjXyqjlXFIHd1rwHYHgfm9Twf8eya80Dfc/kF1GtqknUBkMBmSyXMNGQna1a3fhvjZaydh8Yzm+DH8yjQQbqESRCG7lczp7XDwT+NzKLF3CR8K1T0GlX2hpDGuhVJJtSXjeyNfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792218334; c=relaxed/simple;
	bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4+RU3rZLi4T3AkEI4WZecjynghvLcJnHsWGTKsxjFlq+P7wctX8wYpQFVyrsbWGa7ZgLz4BQ3Ox9GkhEi3omz2zuPqRUH8Cot6ztLEQVwutQoOfARcO0kF7dSvOXGjs8H274XbRNsBTi1NjbyXT3DLPn2U9m9oQbsG8ZpkjOuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APrfs2YB; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APrfs2YB"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6774639a8a4so519066d50.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792218332; cv=none;
        d=google.com; s=arc-20260327;
        b=NBfrWwYDbmlRLM8ComGZ8HWSFAzqDqg1e+FbNQqUbH4a5+mnjviLtWcjp4maaHIj5e
         WZdg39WF4RcJmJ3KSWfWdC5iab7nx+gK5gw4Ewa+bLEfmkrgmy5iA/qVkj5tpuyNXx/Q
         RSeh5VKsQdn20t88rdXAsjxhuGxcyIh73iHCp+gD2xZ43Ahk1iLcmahrp2mpQRT7PrwD
         nT23RUxq+ts3TOiMd418nHjnlvJ5Zn6saiL0H6Zz3yKg5jZJE+HxHoH86n6oi4ekpRPA
         6cwwka9K7Ns/0mXmI52lAMpdRRiVZlP7H8F4nwXAuFdDM8rRikTfLW6zLc9PzQWVDAId
         LE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        fh=pWHyEsUt8/uQYPYiKP8UNdUbDsocYmKCS+su2NRB6h8=;
        b=H/8DeDyr5/j9Tm7EjsR3aHq56u+/h+NXgJVwcUkq6CpXiylMMZT5ToLO+vPnqCf4s2
         cwg9kzMrR2IbV7NtAMvpUo54K60kebvaWnwdCk7+W6ruEidvqyCRmqpRnj2Nhaaog5h1
         M1se5OO3c/pzPw5GoeH3n9D11z/0P/rGBwl0rZrN7/4TrxPCncqjvWwTaPprc/bVwUz9
         2auYPEhCZ+pnwKhHoFqMeTytBCFtahLVAmLfeBz2wjMZtiKTiEjG7uS+kpZ6uOxd6cAX
         N90xAgEGgDck4RpzMNVXBKIHviuRjCDqJN13EK+O7FOVxhR3UxUV768aT4r7tEd9F64q
         HbAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792218332; x=1792823132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        b=APrfs2YBDFHGJtPhqgMs0AiPP3svRWUO/jQoDuHxksXf2dphKg2ql9PZaW/wYWHaMC
         C72v/g7e3oqUeH3S8wGCIPAQE2WZa9IFB9eqejY2BV49oLnwA7PQhNsb/IUY52AfbmfV
         dHQYCYT05+ivErla0Sr3Yvpk9lTknw3IpMmTIyXwkCcknieHuzdDC/yYSesm3YwRNfTQ
         cw7t/scBWjh6xGsNPu0xu/cFZDY4IV5i/rQirWWpz3aTLMbbWgVVLyv4X5Wi9hGQUVXc
         ixFIs56Nt0Tyus9pxL5bFVtWzdfW83X41sxH5vsMoWrPgALTA61OTTD1tBJyQZx0dkmN
         6LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792218332; x=1792823132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        b=EzpBYnAjyi14ygh0ZZ2g0s8VjjCsT5rtjz8yuYuiujKXJ4f3N6Jho38cQKumGsMiWC
         fm1oftBaeOMLq2gzkWGjQplspeZ7+W4dcuO3IbyVGQWJJ4cUUBjIZWQSd640sHBUfuFS
         1bs0I9HJsYvoKA5kOPIZwQfOwzXo838GAMl9zLncnCBacQRHnLGeo0GuJBaOc6jSD+D4
         s/ugNc5zrVVyPqPVBnT77Ee+qt1uypvb++PLsUe/AwTeXM/4aIp1tmILywll89cfQQmU
         VGz4Imz/L6khKzx8BKO9tVW0GRfoTgIowhEqInW7bPG/uwA9CKCFHv09gxXWENl9IRhl
         3f2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjPEkuRVANKMbcABLV4SnFbR99P9At1lUBAMlq2Eq7o37ZgnKyPXjIFof7dBW1ZD4v33w+Hf3Q4UW3lA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIoVxj3xtvg5eaNTmGXgPcDAvOhkopk/SqglpdmbvbKV46XGXlU
	vDv3G8Vlv9QyUr+eeBRr9JxOXqfozaA+GzrSvkA9IC6IcMlRHSSgMm/8eFbjeLHIuIzll9L3aX+
	ntVSlm1YmvZ2rx/XoQSiDCurwSXa7NlU=
X-Gm-Gg: AYBFou15DzvFpvhqkOorMV88j1kqraDf8/fpw8rv6H23RNkcb8UTMVb6sXlnAWC92wd
	PSoB3n73cDMBKFrUTFTqotSyig4Zz8aSAxYHJ9fbI0st8+8qJN9u4I7LSdHOn2AksR7SpZHIxc0
	5rjWLzQi2SZZPrQhpV6pYdaO50uEiYL0N6oo5XgrFw2NvQgYwiDXW/TWm95qR1nOe+ydKgagfwW
	GiLfilNvhKpqVQ+3KRHFeJpeiHhMIOa5brm7oxHa0FODfiwy/TTJyW/EKSVPF61CptsBMw6Gb7u
	Uk0S+C/kdqAdsGeGbv/Nh1TpyuWZ+sPQb+0H8tB5gmXZ6HT37klvokQ=
X-Received: by 2002:a05:690e:138e:b0:66e:5e37:2ff2 with SMTP id
 956f58d0204a3-679ca4d20b2mr429681d50.4.1792218331819; Fri, 16 Oct 2026
 23:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016090930.947830-1-wyibo6109@gmail.com> <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
 <CALQ9cS49UzOPA8PUh8Yf55+D5oim=9YRF9iHw0Hi0sXuZFDTVw@mail.gmail.com> <2abeac6e-226e-4fcb-aa6e-e0f89af27251@ixit.cz>
In-Reply-To: <2abeac6e-226e-4fcb-aa6e-e0f89af27251@ixit.cz>
From: Yibo Wang <wyibo6109@gmail.com>
Date: Sat, 17 Oct 2026 01:25:20 -0500
X-Gm-Features: AclHuK-mqUDVbuqHQaakUsbtYRPEG8APrmj9DlSeAzxy8wzOvvdrEuT53g8Ab34
Message-ID: <CALQ9cS6GYe_hYq7_iuQb4xe8Qtxu_xAzGKWUgncvObGL0NAcCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I agree it's mostly documentation, but I won't send a v2 yet:
the same chip id shows different behavior across revisions, so I need
silkscreen/firmware confirmation of the exact chip name and rev before
updating the binding. I don't want to upstream unverified hardware
wording. I'd rather send a correct v2 once the rev is confirmed.
