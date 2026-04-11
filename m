Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9919C546
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 03:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775878031; cv=pass; b=Ixa5VQUSn2YEamIr2+G++QuOSixJMt471HFsxlItn1jp87Eitj3YSh/O5i8WLXx4nFP4jx9Ptu3XNPPacHeMjPQixlPTvx0ou98J8DcyfEDclKtP/p4UKMuOnpjkyU3hqSDq7yMHQIByZ3qMcI+c5HqlvUSnXzC3sABJ6u40xAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775878031; c=relaxed/simple;
	bh=e88WVrpza7S4Khk2110OYmJcejjIOgQt2X2JqIJv5tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ktNw9PsEr2E5M5gYrvVoaGvhN1TqsdMtx7oqP7YFuNwaBWQDpFcIdRuN9gMkW6WHle+BNlLsGBVw8Q0guRmrgovZHHe6tfzid4GmRmsz2cVLcjPzlextOSR7L8RLsdSWOB8V5/gQcDlMqIcgxmkpCIwqUKGr/1y7vIMw38gWSt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrfkHgzY; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrfkHgzY"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6501c9903edso3125293d50.1
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 20:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775878029; cv=none;
        d=google.com; s=arc-20240605;
        b=QVyeAY4ZdwJUDkNEJ7NRxXO0XUBSCe+Fo6+wp5GLXHzx+KGKiwUnOBabWISsFN2qMR
         VORBKEfxQP7Nv1shGYI+vsJld4sgtd31NcHjUwtfroL6dok3GHzXuQn1KFhjAuanxNVK
         PK+EWRC9DQ4+Z+9hEEAJV5B0Vk0l/dEV1MDTICiwkBiKMqoZ0BL39YUoQU61pJbdky9W
         9EyQYemVWiidY67hqs2VvcGxtp2YS2P0uTtELM3LUujymROE8y/BwwvcrMuTsIWcqvUq
         yz5IJt9HeMHMqT8fjqtktEp+jRF6/llVnVi1BxuIZ96QXiD4JDsJKROG5P/etVIMN4rg
         PHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=e88WVrpza7S4Khk2110OYmJcejjIOgQt2X2JqIJv5tw=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=XFoc8WwShzIuuHHJrNW61psG9rMt2fVPJhKSFx8CaCu27ALimheNvsv8JWMD7GXKQq
         SNg51gfDcRppQuRiQdgqGfXyvUDXab8uYa8FX2pTiCmE8kcMfcvO9SBGMKqAy+cRvjxU
         JCdyjdvOHhA5H1XJVjwJowWnZlQaBOuIIkcIWwYSyKFxWwZVgC4yRA7IVWucWOwaWIwY
         6cyPT17Ud14OB4nByP/QjBqGV60hKCx+rcDNAJ836WYx0LUVODjTqDrzqS62lWS+gkaS
         wIgYfDChT+cMhKH/2cx2/0vCsxAGaJSqFojnLVPXH/SQbVnq/DMfSrekwKKBWUT0p5iq
         HvUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775878029; x=1776482829; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e88WVrpza7S4Khk2110OYmJcejjIOgQt2X2JqIJv5tw=;
        b=RrfkHgzYXzWXJpT5PLEJeA8R9NmvuY+HfxQbI144w3b/YljqR5Aiau1cxqB354SIzn
         bIfB5fqXBQVINgsKBNMGRvHDEMn3JbzrXQF09u3nDADWay2V4ryYgsWmntRRkbNk4uei
         /oESIQYGBFEH5HUOGXTWmewqvQuvnRUu1AUvve9Ipm93Jtmt3aqg+4rH+xPQxttsGveP
         Si3QDVajgBR1/0LV+WlDOj4ECpVuX5vDZMW2X0AXKpGlmZc8qBTmOLRpx6UA7dyJavw0
         6IOcQtgoC6PM+N+TjwFBD+59H36t+8ZfZdMphJl1pryaWX4AOa0mtYYnLtEAZGn7BVUn
         eVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775878029; x=1776482829;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e88WVrpza7S4Khk2110OYmJcejjIOgQt2X2JqIJv5tw=;
        b=tFbgx97W8pn6ZKYkxdelht16YX+nU9wCUiA10EC06CjGudWaiwX16vb/BJimvJgCFA
         PG8DhQu+nVKcXNxqDs0bd1GEquojNdur+SQsrBzJcKHpSxU3aTKfqaW5QtqXaRX0hN66
         3q6Gjg7vYlJcDvclH64Lx7cYUdLfFSz0HoSa+4Lv2luSDYmWM4u1sEf4Fwq9OJN20qzu
         tkBPj3pvq1wB3UOEbGxZxHSa5lrf8YxQyTydXxXbHjwxGjMFz84iNAdKRtc7llEDxKbj
         r30wsbqXPT80YwJN4PTKMgYSkRTOpPxTbugovQcKk+wgeYBraaKtxj369SpQNL/Cx2QN
         zooQ==
X-Gm-Message-State: AOJu0YyNMTWblTUrMmjUBVVM2PcXpi73k2AaNw5NwHh3EM9/rA/CKtfr
	HkOtvaMgHp+ankJufHGRCZS/LVFHFmHymZGAduMklBINK4KHdUAXmP2Co1YHbOVjb1ASysg+3LD
	t/5Go+YCQh8cDuboxnQpE8nVuyMDGsaUKLGwOLug=
X-Gm-Gg: AeBDieu8ah/siwGVHQbBrnEvsVKUxr8mvAyoFaTJl+j/rlFNk1VgOGxg/VdiZBXgMjv
	6bYpP+ypxk/Bx53Wyj2GH5dE3p4Y19w6ay4Xk9Gvzhfdqx3DzZGPTvvRV/gp1XsQgeH56+1cWlU
	VJpCuE0ILXzmbCm6cJtgGfywBJCg/bJiN7pg7lEwHfnIrHh/e+aEs9zrEAwnnoC+JFsc6hejFNk
	rBIUUZDQhblS53mJRXn+7XtLk3KQp/flKL0WcTv6BdMNvaC7Bwk1X98CaWIUczZu8oc4U+qTtLz
	tFoKBiAGp6YE90NzuYcemLOHy3O4H8h6QeqaPmflcq9DBQP93zabtyXcnKsy2g==
X-Received: by 2002:a05:690c:c507:b0:7a2:7b00:67f6 with SMTP id
 00721157ae682-7af6f22b954mr56175377b3.9.1775878028994; Fri, 10 Apr 2026
 20:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411005512.46142-1-mugrinphoto@gmail.com> <69d9bb8e.050a0220.25af5d.8ac6@mx.google.com>
In-Reply-To: <69d9bb8e.050a0220.25af5d.8ac6@mx.google.com>
From: Michael Ugrin <mugrinphoto@gmail.com>
Date: Fri, 10 Apr 2026 20:26:58 -0700
X-Gm-Features: AQROBzBrkoKN_gzVAs2IozrvwYIQxwILp1WA3Nr-A8CbIgEbTC-PCcVOe22B-rw
Message-ID: <CAEiYE9j19pjxasuWt_zhzp7zp2wyscyOz+8=sMY-THKtZt7Y8g@mail.gmail.com>
Subject: Re: staging: media: atomisp: fix indentation to use tabs instead of spaces
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The static job failure on this series was a CI infrastructure issue.
The SSH tunnel to the GCE runner VM dropped mid-build ("connection
reset by peer"), and the job ended with "Job failed (system failure)."
The smatch build was compiling successfully when the connection died.

All other jobs passed with success.

Could the static job be retried?


Thank you!
- Michael
