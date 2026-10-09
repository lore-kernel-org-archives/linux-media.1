Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3AF46AED3
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542236; cv=none; b=kYS+3CnKtInwj/CFwIaLEzwGXPCcPhoJh/ZThTfQLTrCG3LsmlEz5OiYS/1pOqmocZ+73lXv/vH+vOPlapRY6TYGVbxr+gVQAiT0dONIhLDYE2HN/rQ4S0Ycb2uJJwFaYYURIKcOH1UcYznHAZHafQcasrOV7zDgw8tQI3c+KOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542236; c=relaxed/simple;
	bh=au83E6cj4XNqKpfN//WcBuWpGmATxX/UcHGyxZyiyE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l12HpRq18kvnPS5Rl/IqThAQ5MDOvTHbcJHgNChrvfXTz9bAvvZiGXIdPhLvLoBWAplpKsrIiHO7swLcPIl5Afgl652e6nwlFVS6z2/mYxH0vRY96Szdo2pPDwZtBErXVDPqNnl+urKuIb87CO0N4RqnnwbGJ7O4bEVdBWA9Y2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7SDseb1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7SDseb1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1138262f8f.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791542233; x=1792147033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=au83E6cj4XNqKpfN//WcBuWpGmATxX/UcHGyxZyiyE0=;
        b=r7SDseb1abLqSR04jGlSS/VZnarXVYfFHgY78Zc3GYoSO46jV/vm7CRKAcWyAXlFUE
         5+c+hQDvM7eFIMmL0+O/MYwHLxuiL0ZU2+vzJtKOSVFQw9u94lNxExjkKUxXy25zhxk2
         U6Q4XqHieBurdPQhUZSy09AVnu+Ny4jEPzP+GNw0uSHpd0B6ovVjePOp1NgKghQ/UmX8
         Zrw1bAOwEU7CHet6CJiVWTN6+Ao8ApEMzYRBf1Ukp/suEqL5WE+Af2lk1P8+JwI0EImJ
         egBnFHRlCqWFZZG9ED7Z05wl6gJM5+tM/CPqBBHIeRiD5maJrLEgf/79QOnZ5ktswzst
         JHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542233; x=1792147033;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=au83E6cj4XNqKpfN//WcBuWpGmATxX/UcHGyxZyiyE0=;
        b=WuT8EEc1YlhdrVaHourrb7trtd8g3bNSOPUUbF/SG9NnsrP2VguIPyO+vUxKmZJW8/
         m8KXUKMmTenzG8H++bpErK0JN341mBMmp3NZhvZEFhdPy4F9bAlZu4tE+HLy73sScBY6
         q/Azsiz1Ji1q4Km9BAQjsRbf065hIPNi14ihd4fe46BJjpUf5fiXIyvzoUu19xY/fezv
         Byz7z4FfiUaj6StjCDGJDJxJ+qmBm0BZEbtJ+9Iz1qZD5XRLwJjC5tG6UxDlulaZGgRx
         GT8FjeTmgR3F8VTr/6XeuLuXI7QkLFo3jqwuXpEYhAyfGWvPMJqxUlXTZW1MjIB2h3qp
         tV5g==
X-Forwarded-Encrypted: i=1; AKwUvBwjHf5x5CMKbyN6YfkbVcqkYWj8xUx0YgoRLsQxXwXprw+bHpjRU6fWz7tEy8882Tu4KFGOR42HFKVJ/w==@vger.kernel.org
X-Gm-Message-State: AFuF++mTD++0VKtMcwC/PN16YDhKe7AFtPwBO7SX37XIvDj5QZFY47+W
	405fpBAAS/LAItR13Uk5ukEa4f9GGq/fDPkD15eO3mNcNzFuS5AiJ/DV
X-Gm-Gg: AYBFou1trLECfaC2+bi3GMrrEGtVleR+NgqPbr1XTyt7C8YZ9jhNGBZYcBdT3LBre5z
	46bS6N/njUMB+bEc0Tj8CJzU68+cKXosIJizgUwSHkjesy/uF5RDAKJW2Tk6w+CkIihcBIzvYH7
	jMsjMdFLTIP3IpqtWOhxEp63y34v1cuW6AMx27E0JpjHmRJXS96I0Jthk5GhXxUvlGGzjmwLWkd
	jSSDxYcC45uqDweyg82PUrZz4ku3yZPIiXzXkYjWSfzNfq0wvhs7pVYg2ydv2Sjn+83/NzA9C3w
	bM7FTCnqrIJkQN/8+w+vHEah0SRZ21QB5HocEUIjYMTlZc+t+QffcSqShV8SlOENJWIy2cUxzfP
	1Vml2Y5PbaBliCBqWCxuPBb6dSR+xelckFGrmrk6oGmCTqqgYyZygoW721XhAI2Li3zkkM17aFV
	LGgUPMhUbUW8oNo4k8fMW4O8PdUJnFCLfNYhj7pNITCjmj7x/olR+OtPxlPpVIL6pZR13FUU1iP
	wfOqPXWOEkqHptgr5LdAB6rYvsp7ZouREWSqfmLYAp5ayaZRVER5m597ng2YxQuSjeDu9GxasYv
	HQF638ayMyb8Fd7p0tiqXwqVak9naEz9nydHdr3U+V5KhbHXl/s2Sxd0FhFQvLwceDg6fmuyt0e
	eGaHkFhuS/6NWnOCp9CszaHJUdArioPZuPxMMyMky
X-Received: by 2002:a05:600c:810a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a18e3ef100mr23787335e9.0.1791542233252;
        Fri, 09 Oct 2026 03:37:13 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm43824715e9.5.2026.10.09.03.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:37:12 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
 hverkuil@kernel.org, ngocthang2710.1999@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Fix NULL pointer dereference
 in subdev_open()
Date: Fri, 09 Oct 2026 12:37:11 +0200
Message-ID: <179154223159.24434.8243590649181320964@gmail.com>
In-Reply-To: <20261009094810.GA716311@killaraus.ideasonboard.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-2-nicfio@gmail.com>
 <20261008054842.GB683793@killaraus.ideasonboard.com>
 <179144316198.13032.1846729931094664641@gmail.com>
 <20261009094810.GA716311@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Laurent,

On Fri, Oct 09, 2026 at 11:48:10AM +0200, Laurent Pinchart wrote:
> On Thu, Oct 08, 2026 at 09:06:01AM +0200, Nicola Fiorillo wrote:
> > On 6.12.86: agreed, that line does not belong in the commit message.
>
> Why was it there in the first place ? It gives me very little confidence
> on the quality of your contribution.

Sorry, that was my mistake. The sentence came from v1. I first hit the
oops on the 6.12.86 kernel I use every day on the tablet. When I
repeated the tests on media next, I updated the cover letter but not
the commit message, and the sentence went unchanged into v2 and v3. I
did not catch it when I reread the patch.

The GC5035 and GC8034 drivers I sent today were developed and tested
only on media next (8e26d4c20), on the tablet.

English is not my first language: I write in Italian and translate
with the help of an LLM.

Nicola
