Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAE2222D0
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511495; cv=pass; b=sdtAhE6O2cZml1uzqpDGP/eotm2N1ahgusiDA3f3yY/41YH58U12sXB7IKXZi6+n+5oXd4nYjXAOsC0/a2pdEiFkUjbg1rLrZAsyzoip6PSOYCQejDxbxx07N7K6XPj3km269VSAUTN8lGx4O1p/t8P4QI+9x3W5LjnffOTcRLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511495; c=relaxed/simple;
	bh=6YBluN44vn1K1zdygKCYLVvaL75uNXIYnN5GL/Jduh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=En5fv9d1tIed7U/TnfAn6f76aBBBq/IcHNPhAAu9iaSJNXCsmJJJViRg2TzYrm2q1Uqz2c0UjjJSnTJhe0tSarCAozPX5faO1v0ORufLsA9HmAZqaL7zgZ28umY9o+Duf3BDEqgxZUHUQvqhxfrtR6MIrTZp/N06piNKfkKI1t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vzk0y7EH; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vzk0y7EH"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso7191575a91.1
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784511493; cv=none;
        d=google.com; s=arc-20260327;
        b=nwtRyZzmG3GYbi+42LzTAUGFnBN7eKdD9bnrC7DLFjvpV2kFAmz6JNlNlKMqNuONI2
         Nr+UjMVQiOYq8otfP5aIWByKK+rsZ+OL8l+gAWrvKe454SuBqDAIRmqjadAQRFUe/Ubz
         gIq5mYPHl5hhfSTsTzg2VQvtw7Pc0MphdHfj0VG1v5s9DEl+3fiGXg/tUdWiP9crmFMe
         gZA/xge79aIWgi30P9yb3VMwZKIh+wC7OUJKOyKLv0k9IDqNGCRESJCBsWt0tTRW71Fy
         WBycfqHTd+/tcq7ngdZQliNPWDR+DSXYkOz+RvRiF744fv4yXiRV6ai2GTDdmb13UXHV
         d52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6YBluN44vn1K1zdygKCYLVvaL75uNXIYnN5GL/Jduh0=;
        fh=WHvC3jxbRSP/7R4woXHQbTwMf/LvURvTg4yRh8mftDA=;
        b=f6vJczsYLEvJN3UX8CXlI/AShOHMoQRw/AwRZtkSSwDKpGBNIAx4yR53XZT1YqxLU6
         OAGmSJJ1/MQLsAPvSAdZEkdFNfpNNc5BP4nU7ihm0V6G9LU493jFRi9QljAyuvkX/T2L
         psX7WdxyucGPW4E85NmUhLWl1LoNMcHMjtxmJRnF00n3qPU6Dv75DrGBBX1+wTSEiF+4
         A8ap1PL28Iqfb9PTrfDEWWpSZg/Ntb6GdWQydWbs1LGqzgcfuAxl+hoDbt1aRcIA6MNI
         sRkYkvwwQYIRD3AZstCvfLzZADDsqwoWHy1nu3jHj6g3cBxINAycqbMl2aGj30qYLE4V
         UmuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784511493; x=1785116293; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YBluN44vn1K1zdygKCYLVvaL75uNXIYnN5GL/Jduh0=;
        b=Vzk0y7EH0EYLnDMzLtj51gSeoi9REGUYGIhKevvuerVqSybcNq+izlfTAF5f/nX20g
         dY+edHMJfKRL9TeTL4j8nDXapnuVlIQ1Vm1AOu2KywkwhQxwpebtdCza45jwUAcqTA7E
         +tagll8d6Oo6+uwAgIhoBt+APcwV68tBqJd+iUaU783g9LF/fjN/5aBVA2HfrRzEEKVH
         f5Wb1UMqlw3YhJtiwfozIR9ercPSZTdc0B62VxcpCxYbotlktG9sOkxwzE++cq8qy0uv
         dD2nWKeGobMWDBIDbmtm+OhhNmypmeATuvceHWJg9LjgzlO0XhYi80dzXuP/3ExOaIqy
         T9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784511493; x=1785116293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YBluN44vn1K1zdygKCYLVvaL75uNXIYnN5GL/Jduh0=;
        b=aLlz4KmC/cPVvuyP1QzlYhAsA+rbPBU7OIaZ8XH155ZyJ+vc4GHLZ5fX1MmgQrDPj2
         gYbIXv7o2B1WYjeuH41XuFeH4YXYeCcPaq28HrHEGTJiWd+qP/YMK09NBKwU+3VMeq9v
         ODRPrsfaOC3mNfOhZoeRnQ0XFybrBW16ttjqLvbNXqbmC4iVrJyKjwi3ILaM4xTnDicL
         qzuJIuOonSpNt/wKFDMZ83J3kChOHoArRZ3EYv+sSdxQaPwQ89JzLZXNnpzB6dGWjPFA
         C7MSW74aZcA5vuS4PJQDUE7ZlSDF6YcY/xwTsKmmISc61/sLezzj/RVKzG2l0bnQ1hFr
         NIoA==
X-Gm-Message-State: AOJu0YwAJav72sNrhz4WIwzVISioTo0AnSXjaGKbRey+Hr197b/gVVGj
	nIr5vS47dm4RH5qEPqtU13B3NEhO2iZ50pTrtPIYJseIPuce323JNRUf55KjCte3npxrizRnVqQ
	T20ZWV2qiOGf+NI8ISu7Tm7nFSvBSk6fsHfVib8AbBQ==
X-Gm-Gg: AfdE7cmCuWeqnPchWSoDMTUDraqekMW304EuB4ml7rHpJsX49pukMtOl84oz5jeSwGz
	lg5cAh2RfF/5kq7i3vFkqlGplLMNwy0RfyrnQ9r5tPpuRMMbeujhQ3fSkKvpsrbyNbN8IQ15kiq
	5uOFw5d8BnPI3U/vfodoX+xyAZCP0LjuAaeYc37a6bbjlWGgJZgdTmb0oZqVBeOs/UN9fX6yjAC
	NaqOqYiY2cUXGTOwgfUyAM9vB50Xd29xPXU0r4kEjPQy9SoxynBZ8ygzDPdPg==
X-Received: by 2002:a17:90b:3943:b0:387:e0db:3fa9 with SMTP id
 98e67ed59e1d1-38e4b5a8246mr13000542a91.34.1784511493204; Sun, 19 Jul 2026
 18:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630150403.46327-1-nikhilgurudasani314@gmail.com> <CAKD_UFRKWzAahEpxhjEQiwzgrwmqhAd_y0AQzwo3gtz_j4K_mA@mail.gmail.com>
In-Reply-To: <CAKD_UFRKWzAahEpxhjEQiwzgrwmqhAd_y0AQzwo3gtz_j4K_mA@mail.gmail.com>
From: Nikhil <nikhilgurudasani314@gmail.com>
Date: Mon, 20 Jul 2026 07:08:01 +0530
X-Gm-Features: AUfX_mzu46RK4RbyREiGuJm6Mzh33OQKg64hCtE_bUd3oNpLD5lZnbfUzvXgB_U
Message-ID: <CAKD_UFQQeb5D6wpLvBKNWiyz=utf56_ZuNS1bQVs+tsP_edP9g@mail.gmail.com>
Subject: Re: [PATCH] media: dvb-frontends: a8293: propagate set_voltage errors
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, a gentle ping on this patch. It has been around three weeks since
the submission. Any feedback would be appreciated.

Thank you,
Nikhil
