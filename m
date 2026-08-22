Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3818528030E
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787432620; cv=pass; b=cveVkVN6AvLq2zXFD57htpk67XWEeXLSgMJ042tZyNwFw2eJ+qRAJCZsB313owfbjCkIVQwRf5q0jaRxf5lda+YYB6I06Qpye2D8PAx2BZJNzkNGkH4D6YkKm8wgLqJK130he8mmyNQGnRedPI5Um2ICR3P5AqMKq/tla6nOdaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787432620; c=relaxed/simple;
	bh=ybuRFojvpGjf0aGWBBaIE1KHZoEmeEyWTZBu5Hionjo=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKrvxoEWaf/RhdS7HfIITaS4JDuKRjF3v8vH9iBLaf/vsYyp0UitohwW5/88LozmxuGku2jmPdXtDMu3nY7jYwRUACJPFSTabzlfTFcQCBp/6qN10mxawoNMa5ua6ylhXrF6cYA5GqAfPdQ1ugkZlPIUeBX2wAFnaflRhRnOoeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=ehPS2YQS; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="ehPS2YQS"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c70d1672cso2279074d50.0
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 14:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787432608; cv=none;
        d=google.com; s=arc-20260327;
        b=Pe2gQq2KKDmcwGfexZ+wqQ372nDw94Xo9NVsaEZ1es5YaESjrgzS8SpAOIcMAqtX2b
         Rrvi8a4i2O8texl3cUddgM3J1Ls6OZ9KwLxJaM4quFjhwcqKPMxbvX/gOcW6AfdQSq39
         oCprSapfDCG9z54NCGTHzKJ9epK6dYDXltCH0avahRh7+Md03do8KmaMvNBupbqiX4Qu
         Ho0KHvZuYHoDfH6QADgtEfCq7UPw9Z+tV7mAITPFSP4RKUonJJVoqf7epkLlYTq5aleM
         VZZPSSIUoLLonzAU6j6pO8oTuePDI0nufYVkqLz6NwgUfL0FZWzvD0971h6RiuU9+GIz
         9img==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=/A0wrsQwfJg2KIFv6KE4HUSmAgBmV5Dc+6wtFDTxg5c=;
        fh=XNlYLSukVGBWUF0/NGdRAsbIb+uHpcPr5C8mtjNVLGY=;
        b=YMm+lfMdv2aCZCe7RRyV8E7aExc6Afowe0BVR0QBEhiCe3/9boXQa/HJX6xaa2C9Zc
         BsOoqBUh+B95uHqhXr18E6stNhjqG9hO9gGIxYFv5bHuIRzJMODCTefH3Q4qEZW4uR8A
         8fBPB0oSYV2FVd3ygfbYwKihEjhOzc7vBx1JRJPRfQwxSLeaq2sLp/xN7HOx6gK+JKo/
         sLVrp8uuYh0qS7VSUR4xlQQ30LCYvJqEwUCL+7AL3yXkMFCp6MwIAbtyx012zz3NFusm
         VMCa+G2eHxNySvTCLaiPg7DDsMySQqVwPZ7kgEgs0VV+u0MHxvFLJkvh3burWi/MC0+F
         QXxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787432608; x=1788037408; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/A0wrsQwfJg2KIFv6KE4HUSmAgBmV5Dc+6wtFDTxg5c=;
        b=ehPS2YQSAxPSKM61DQrAjXLnb0H59Jw4hOCGlwUS1pW1QftVPgiwGgXoaFHPhvO2Ht
         G/EyKtqxdCeRUXqpKLDIt7/mRWCXqtV6auRNIjCs94L8XJu/iz6Gauo2zOJB/K3vsE1O
         Hg6XgZaM+cYEQ3c9aClVxyGaERC488fwpa4YEcsjQ7YHDlni3DO4gizd2SeWPFtDRBWw
         MPPhNBCCTdLQWlFoTy5doZK7UugYY3bkt8kvihVyhRnBOuol7Xg2ER+Hx5hENT0rzqkv
         xVvb2sZZMnGWKlLKZb0V+8u1GaF4AQMTK9MUfvAlWurC23k3WbdcuEZcVCV3nBzm/UB4
         Co5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787432608; x=1788037408;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/A0wrsQwfJg2KIFv6KE4HUSmAgBmV5Dc+6wtFDTxg5c=;
        b=cHpxuZSi9A0dlgfys2DN4IuPG0VYzuqmk3MBNomSeNyZVK/k6rLyo4Lv3G97vy7Mg4
         pUDzsM+Sgyjh0OPz2eOoayzHDosQ9PYhIQsAc9frgnF/l+SlEA+rTL6RqvC2CJuQHe+5
         TqFU4bZMyKvA9RdKN4nRqMuUB/98C+HSzoU4ENYP0YrsjDzxESSvXJHCUv1tI4qEVya+
         vsYdV7fu2cwbp1NBi46JCo8izVsIg92+ztdvQdSUYVWI1rsRtqUAKCAWb3GM/QjhJ2XK
         iZRt/LXnmj269Nvp/y1oikiskYCewFLfiDGjaoHPYAI7hWj5QgOdi9PxK/FiKHHNW0GQ
         Alww==
X-Forwarded-Encrypted: i=1; AHgh+RriUcTELvGCguw+OoYCYsNQaRUcK2KhvjblNthBtApXyPAawAm13SU40PHVp0K0PWDX+juwr9YsurjBCg==@vger.kernel.org
X-Gm-Message-State: AFuF++m68uqqmIgwVo1Fowd8/ieuIQRzVS4wkyQxS+pRTySV1unfbM6q
	WAAL9wHD3rM6qaiHAAKiZPvzSo1l+OrtDLISlrgtbQjOMq+UVTcvvMbNTmDa3aOMdAvzl662cQd
	ThGPe3ncJfKe8kR1xjBX5wBHOSIDURdN894OC8I8fdA==
X-Gm-Gg: AR+sD11lUX0EmwlwXmPqErUzmMr/6DZLK+vnYvvnhwFnf6lNspS7tfHGtTwy2U9lPOV
	jMpm5LUAuwItb4GPALKpHno70fENFiup5wE94C9KQUEHnJGidI3GLE43wr1BtCatH28KhTdJ5vs
	ASukDVFqB9v4Pcr3Z6IAexmZvmust3j4L+sKasJkuQbS4RxjsQqhRTI0gN3ox3R2GY86XzQkbig
	kNZGpCsfmulPrv4LPGDxgKulUREtzeSsGOfjuoGxJFd+LkEak0wr1UvMuCy9DAQJMQv3j9dW/F3
	9INYzDuioHqw/Bw3wSzbl6BHgcEY/dTJ+bABKUxiNwehGmck9D1HxPwUixk4wQaLw76cqSfJLeB
	AgOJQ/qc/OeSm0fyyMqQU0+8XkZRp7ui7CdlOlzDkeNX8uGJrbtdTKZ8qJzFMi9mMjdg2waN9O2
	d5M489tmhzjzf9rDRm83eazkrGv59dtu5nE0oWmKe2gbM99skhAxZqtm/aAOzl+NABMX1Wea2YS
	Fn21RATDvLsSOmQedtJrSKGwh9rz9RGZydwFTwUvA==
X-Received: by 2002:a05:690e:804:20b0:66c:fc24:a701 with SMTP id
 956f58d0204a3-66cfc24b288mr349585d50.38.1787432608114; Sat, 22 Aug 2026
 14:03:28 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2026 14:03:27 -0700
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2026 14:03:27 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6a8a0be0.92f6587b.23a616.89ff@mx.google.com>
References: <6a8a0be0.92f6587b.23a616.89ff@mx.google.com>
From: John Cronin <john@stromback.com>
Date: Sat, 22 Aug 2026 14:03:27 -0700
X-Gm-Features: AcwNN1U1bGFzpIusxyfs-JgLc0Iv9XIpewoBzUCpZEAJy3YBXz4eEHdyZNO8E98
Message-ID: <CALr1FG_4JYUU=b2C8okOOQwZATthxSYwes2i4DfzW-sAqY=t6g@mail.gmail.com>
Subject: Re: [v3] media: i2c: imx471: return 0 from get_selection after
 filling crop
To: patchwork@media-ci.org, linux-media@vger.kernel.org
Cc: hpa@redhat.com, sakari.ailus@linux.intel.com, hansg@kernel.org, 
	media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks. v3 applied and the code tests passed; media-patchstyle failed
because Gmail rewrote From to john@stromback.com while Signed-off-by
was john.cronin@opcenter.com. v4 adds a matching Signed-off-by:

  [PATCH v4] media: i2c: imx471: return 0 from get_selection after filling crop
  Message-ID: <20260822210311.165824-1-john.cronin@opcenter.com>

John
