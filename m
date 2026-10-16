Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A74B2D7817
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150384; cv=none; b=L9THmyJU/FCX9KTC/vVFrwX43G1Zzzn9dLWprGjLkfpsLRKXdAn19VZfHQGojFaW1wvv+hIpIjrIY4Ba6Yh+X+VLThVEI0eCa52ghtqpngOnvPvBJeN1Krio6nTqzr7ceQZq1+gN5dVq240AiEsZUdFP7uwcv1VSI+H9Rr8b99s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150384; c=relaxed/simple;
	bh=F+/gdFBwGyd9NF1wNEDnKR1WRHrb87+RISxVG3LG6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSvY38eHic6MJXJSnCBgoOvtbrZx8726ram1vSGHwslAxrrFopHc6UQKuHgDsjnCKUj4L4t8RizkcEe+W+D6c/LtY07F02vSXrki5kWDWuYdpAw66q1GcWLrocPRraID/0j6MLqXaXBSQeoA93GEFPQR/0iVpxD8Fhw6ozEpYpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDBTxqA9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDBTxqA9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0584ad71so3785388f8f.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150381; x=1792755181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+/gdFBwGyd9NF1wNEDnKR1WRHrb87+RISxVG3LG6nc=;
        b=HDBTxqA90HEV5zn4gAoLyOHG7K5OBxhRwNVOa8Iaco83MAnOU3jvNOXeSIZetWA1+B
         l558jlaSIniv+vkWR+NOvQMBx0d5GvKiDPN3bqu1Khi+zdU+l8aj11hIa7mdjDkUnDvu
         ZZdMwfhnz6pqSv/5mOKsEA2k7DXvgmJeJkF1FgGrWo3P/RD3+3rwso9rcUc2lWVjz9S1
         Nx6NQfehhG3guGRnjkJdzllTtvfiPs8FLsqPWhXuI5JR0D35ZgaAG6oXXVX2SkeAp2N/
         nCe2j42eflPdHbyr+x5Jb469UTg/zz4DsMOaDT5wt2RdJ7UP3fX5o0824Zj/95lc0YXX
         TK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150381; x=1792755181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+/gdFBwGyd9NF1wNEDnKR1WRHrb87+RISxVG3LG6nc=;
        b=lESm2D6WNrybrWnFYJknWAH3Y3i9bLcOv0uyzIJ2KcbT9mMEBKo0fnoy3xHoL+E41M
         oIgMbNXM9+mO6T/6q2OD8GdmEXz0HA0DgeppdYmS9NDx/1dyZ1Vj4lOQgK6hxMS8A/vC
         ki8pewr0v6NEWE/APPAW5PZm1BKKjQywtBbKeT+nWsyuTjNqkhAyhUQ8asf2tHBmFGxy
         0tBoWNE+5gKAfvCJqTrsaPL2yYcXCzX/TtQAhHkw080R/xSYdwxB3ahitRJ5PIwd1iKM
         /PdT7LqI7vUwYUNvt40AzuN5mwx/LoQkw+4CwP/CPMJMWkVf88hi+1JHj7SWKzHeU25A
         XOdg==
X-Forwarded-Encrypted: i=1; AKwUvByDuu6cJ/eGXdraChE6p7gzhlfqMdn5+wkQ7fDEEHxDpXhQq8aaCsL3WbRW7ZxagLzYwBJJkigBi9/DFQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7ByF4lY1FMpIaeH6wMf2Ym9e0S+XTn5bVDVmFCva8HGPonyuM
	ou98UVIp4M9sXvylefSDG+rSDLEKONH8z8AY3MUDjN0i6YhL4nwgUdDf
X-Gm-Gg: AYBFou3WZRYIZ4wLwmy9FZ+VzTYcNtoCLg4wQY2RVbe17y4CH9UwUkZ6yVjAk2F5Qqu
	23PcQ2e9Wf1nJFcwnWnFMkPfAZwghd2GlB6bl8kf+DY8JNgHeUm7+ucdCidwVZXk5Sbz9LrOfJt
	tuxqM8lBjXnlDkrI4pC4um12KbQGh1+LSxXWkr76xIcb849jIhKN0ZCqr7ff74bYSYeRqENdhjQ
	0BTVfl7CbqgP7jce83uv9aI/1lWeCpSsJMrmzBiw/kdoEzLiMJ0G5Pt9ShbfySt3kikXnxvi/45
	BTbCguaEq2+OphmyTpzySZcgjgzW1CxcaUwOO0dO7vpYc6jALw/H4Aor32ADPQ6ma1Uug1n41MZ
	GBuKedhVVBzOZTEmZiNAPNIhJgV95H81xC3QhwK2JiSwn9PhoFr4nxiLSDNxZafhug+quI6T1yq
	gl5LJjLxnXj3HhhOFgeTOEok5XTmU9aWjz2coY76Zc1y67y5YCPbdbvjMWgDcEX/PCY748ln3TQ
	2sGnoqcFLvj6RWszMjA1tBHn7ABqP3G1ADbh/ixBZ0FRMKASlHrl8ah/D9dIfbv9aJ6aZl4
X-Received: by 2002:a05:6000:24c1:b0:48e:6f:19b9 with SMTP id ffacd0b85a97d-48e006f1ademr2357813f8f.23.1792150381293;
        Fri, 16 Oct 2026 04:33:01 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm5057285f8f.8.2026.10.16.04.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:33:00 -0700 (PDT)
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
Date: Fri, 16 Oct 2026 12:32:59 +0100
Message-ID: <20261016113259.40819-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b96649d9-5c1c-4fc0-a77d-d0076cf80b86@kernel.org>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com> <b96649d9-5c1c-4fc0-a77d-d0076cf80b86@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 12:02, Bryan O'Donoghue wrote:
> Small point of order here - this is not really @ RFC status.

Understood, v3 drops the RFC prefix.

>> The kernel was 7.1.5, with linux-next's CAMSS and CSI2 PHY built as
>> modules; the test build needed shims only for API differences.
>
> What's this ?
>
> "It builds" I can verify myself, "it works" is the thing. Just slow down
> and get something you can test on hardware.

Fair point. The frames in the cover letter were captured on the
hardware, but the kernel underneath was the 7.1.5 one this machine runs
day to day, with linux-next's CAMSS and CSI2 PHY sources built as modules
for it. That is not the same as running linux-next. Before v3 I will
boot an actual linux-next kernel on the Surface Pro 11, retest both
cameras there, and say exactly what was run.

For 4/4 I will also move the fsleep() change into its own patch with the
reasoning, and put the lanes_enable() decomposition in a precursor
patch, as you asked. Thanks for the reviews of 2/4 and 3/4.

Thanks,
George
