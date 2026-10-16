Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5E37F002
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162530; cv=none; b=FReEHEjwpkQseSxmrwfQU1pyoFNMGZ1zIHxEl5Mxr0/itMyA9qW2rk+wuNkRI5B9v4ZKbcsD8EFfuNOVHhom/nDB1dhUNzTPv0pavG8RLyB5TOrjCPofalMq40+WOcQhp71cPrlONGfB0dmJr6Gd0jv16mAtePdjshbohNObtik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162530; c=relaxed/simple;
	bh=JZjJe/mZazRkNVQjc+trRezxwdNtkxCjK1msLq43IJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQiDPixT6nSyTxefs81aTjYYqzmAUB4mOgiFo3blRjauONBO3W3OeFC7GbBsxY7V2OCHIII/gCWL1RE+ApqFz62aAdlD728lEDvVmaK3S6jfluonQeMwRkKm8hh7AzY1grKlg2oZSdzGorQcGpHqRE+xBTy2RNFHbSijubT+oTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKvCAiVI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKvCAiVI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso428995e9.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162527; x=1792767327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDjufEIvnKCHnzQuqZKJsy8InAts45tbC4Yhybb8ScI=;
        b=WKvCAiVIFZKeiV0LkvKiUQCucAAphypPK5C++55v5Ucml/rq24PQxbuXOoNt3bHjre
         I0hnj65Cx0F+snYB4JPrn1S5kj7kcuxFTrcdo/eP7PLSHH8xxe7Z2vTNfKWqsAP229RO
         2l1L47v9XHlFocHK6WnAwr5HXJ9/m3G3Dzl4WnLPy0FcYCqBbK5Xk2vC9ulEcIBFnUDo
         /qNcmJ2+fPhKy+N0c3iimimZGPLtZps27qUATBLers5UC46rAaFIQ2iI62xw0PeU8BXJ
         eXDerxb22aG67d40quUzDCsOv68jearjAAgiyBevdzQd2ukuPxyX36DTUw58wkrl3QXS
         gEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162527; x=1792767327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDjufEIvnKCHnzQuqZKJsy8InAts45tbC4Yhybb8ScI=;
        b=aKEh6s/LD8ot6y8Q1BD4Ii/O6UgJlSO9n1W4CuFz9gaGtIR03KpPLKKt7Jmc9zTVNX
         WZtIJdLWLWbR17yNbGJD26uPIhFdbl6YCkyufK0BME38rkwkLcKrcZUc7ogoG9z2gdWu
         8JDIQPKst6HqRVFA1m9/3aiVxCBaDY0XJ30ybKt2UxSb8I2caIfXQNub/y7RYus1A2f4
         Rz+VvgZwIda040GMKQ66GwiLgNOA7HWg/qqql+H10CvSmN0tkEJ8DRejOwrdLfhzoOCs
         GOirG/bJ1Z73sE/L4/h/WZmqMOKBjqutgGdzn57ZA9rbmr+OQebFsIr1v0Oa+ZE5erpl
         47Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzHuNSjPaerp4lQ+V7JTDgmRSQE1FZIklLbJ+sQconHG+43igtY+ys/ez1QB5aP7LbsPxrwHgjeilmUzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3IFK7bPy6T4L3VC9OTfAX4/SAPhwK53fmb/cqTgcz6BcPb3Ek
	ytl71ApIjj8GED6atxySdfwxQXd8UcP8tgaRL3HWEDubUyi1vY26cKrf
X-Gm-Gg: AYBFou2vJI8cmOX3qOwYFOflsCRYex0Zxx5z/dKfmEL2eUzjKq+dRbc5AU0A9JhHC65
	Um9onjLsKfW+f7bm7wfbA8iQ0clC8mQCkLFs2sM0rU4XQlbnqiqJO2Q4FAtKNurRPHF6cLDfkDC
	Rw1iT8EPbQMN9Oql0dZEkWmGp7S51GOaaLu1fY4w0sCVyFOJ407BSDwf2/uM7NOQZ+h/+kq3xD6
	W4RtGt3dFxgau5eVhKyv//hLRhDKRopsmV0ZHXOOjmiOQ+C6nvXuN6oVHjI71gMYhNtN5xlaCxv
	Wgjb70S+UKf83QQ6UvEUm7fQClSjS5jrOIHrDjHXWWmBegsJKgd/rQC3zGy1X9IUDKiRmo3w2r1
	MSS46i9y0aDPjryt0f9pPm/AiFQPYOoxwFhQHrML98Vk8Dze0dJ/NHXulucBgnBfiv8v3+r31x+
	R+tnSmPlphkZl2ohSbfeASLmCN4AZWO2gq0VMIJDt3R6j27J2YGNosz790KcRF1YyVx5A043JrH
	PfK89l/F+Wsv+PpM8F6f1B8M7KBAfwv4VBaMKIu/uk1QLtOK6Bnnf+46rPAocp20iS3AhRK7bl6
	z0sJjuU=
X-Received: by 2002:a05:600c:4ec7:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a1d760410dmr1027935e9.19.1792162527070;
        Fri, 16 Oct 2026 07:55:27 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm6026423f8f.27.2026.10.16.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:26 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] phy: qcom-mipi-csi2: C-PHY for X1E80100
Date: Fri, 16 Oct 2026 15:55:24 +0100
Message-ID: <20261016145524.36641-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <efe328a8-83d7-48bc-bf45-90f3535e2657@kernel.org>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com> <b96649d9-5c1c-4fc0-a77d-d0076cf80b86@kernel.org> <20261016113259.40819-1-geocausa@gmail.com> <efe328a8-83d7-48bc-bf45-90f3535e2657@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 14:27, Bryan O'Donoghue wrote:
> The bit I'm a bit alarmed about is "stuff was stubbed" which makes me
> wonder if what lands in -next can then said to be actually verified
> meaningfully.
>
> Could you git rebase linux-stable/master for your 7.1.5 tree maybe ?

Rather than rebasing the 7.1.5 tree, I built next-20261015 itself and
booted it on the Surface Pro 11, with nothing stubbed. On top of it:
this series as v3 will post it, David's v9, the two CAMSS patches from
v1, and the sensor patches under review (IMX681 v8 with its C-PHY RFC,
OV13858 power-on v3 and its DT support). The board DT is out of tree and
follows your x1e80100 camera DT v7.

On that kernel:
- front IMX681 on CSIPHY2, one trio at 2.4 Gsym/s: 3844x2640 at
  30.01 fps, and the sensor's colour bars are byte-identical to the
  reference capture from the out-of-tree driver;
- rear OV13858 on CSIPHY1, four D-PHY lanes: 29.90 fps;
- the settle count reads back 0x1c in all three trio registers, which
  is the computed value.

The same boot also turned up a NULL dereference in the CAMSS TPG test
pattern control, unrelated to this series. I will send a fix for it
separately.

v3 will describe exactly this setup.

Thanks,
George
