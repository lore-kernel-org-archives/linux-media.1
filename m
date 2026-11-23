Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448379;
	b=CK76j4kd/MOJxoo8TKMeo0seHFaixIRyD84b3TT+2A8tXPR1Kba9m20A0pa4QsV9TG5n
	 ejTCRvZiNLL/ZDwgrgL5aH81ayudIaD/BvyIIJtqE4atv0xHFJ+4mBUuEICCRDjANTzX2
	 RbyZ4lHFIU3Qe31Hhoy4xIwcW7W8LAKIr39i0Z+82nio5wdTyDFjrWElDPmnSGem4pB6m
	 Rgw5/ee3y+UAR7fXkasAz1B1EKylvNKdfANYO2EZj2Sf6yiTlm7cSo05ejU5YjTZH5mXm
	 tJNQfz0GrbitHnJ/Iz3GWxqLaBeJTILeaw5kVn0rVGr4rn+5kuA6gEZeeNJG4nkGQcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+Ao+iArUdzZvDA/o0P/U+DjqkQFyg7GN4QIAQugeBDM=;
	b=A6hu1dhABRK7FqsW8hz1ZuE3oL6hcXzObf0vhqnWUYH7VJgGcUx901RL2KxyvVXd8LoL
	 bUR8JUU0f4LOLiFIvwJ9RpsHTCIXOgFj1Ymtc9L7/MH1gSh8FAJDk6/v7SPA2B/a8E2dQ
	 Q+rnID7WkjFHsvwsRNeHu+qMJSgp7uCvNcPKeTIRjIJldkuT9akN3xd59unHEBcFbpFMq
	 YQ3xeCur39e321w+j8YR8ELLgv2MRRcqD76+7A8OGrr5NqCG8UMA2qT//CUXK+hspQzCM
	 4XV8ZQ2VQIlDIx0yz6Sol+keH7SXQsT5YS4Cdrr8wrwmHKoPlLNWMmy1FMu2CDphxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrsUUONr;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A52606A68B
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A52606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrsUUONr
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b546061d58so7607467c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448378; x=1796053178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ao+iArUdzZvDA/o0P/U+DjqkQFyg7GN4QIAQugeBDM=;
        b=hrsUUONrG6/XbhHlx0gtlkpF86Eg7SgoC/55/vEVeCdxXyAZrSnQxXKUgLOmBKcVNi
         hgn2qPHXIFz8t8ITCx3vNAfUKTwKXhr7SVx9S1TSM2LpEuSkGMIGrEAKDHbOsqL1kbgG
         sTHDCd011mNW1M6gdMTv1Il+mGTX5LQLcF6mRnhqdhf+dUhWN3nmFU6gwvA7A+naTm7k
         OUtcG79JFaLOyi8FfUXvnC0EJy+4cVniCipmKSSQrFJUtfCCtRPCZhnCtbvv6W2R7g6v
         0XYwO41iN+umX0myX2h10HSngG40g+ihe4100Znk8MPMIEMJ4T1OLqMFtbsQS+Z93UAl
         yGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448378; x=1796053178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Ao+iArUdzZvDA/o0P/U+DjqkQFyg7GN4QIAQugeBDM=;
        b=on1gJkoc3bF62bShUok5XkF2B5cGeZ8GT4+aFDoAuAUbjt7+GUgIZCYKWM3dWLnDqb
         er4phMvLAMgU/OdFry5IK9KNdC4j4WXNzOX8xZnTf85r8oWaLx++vzibwh/t2vS7jZLo
         mlPqZQkyCcz3WnmLq1GXlgCLHcubIaH2TQiSnbVyFIm9OoPvXiBPP3ZQm9WoGiy98hJT
         CskXsKkc+xc9RORciBEISIRpNx9NC6a+gGPScrnKPBrnqxbPfHr0jl1qq8jYyIHAxCDP
         dhQqI5udvdotOwcAskiXT1JdvA8oiOFKi1d5dzGlFZxtQjH3bVMbXoBHCrixcwRJ/8z6
         eg3g==
X-Gm-Message-State: APuU4Z9JPlu0qU+C7e12+AXs0OXf29ysgZJBX/UwXHgGZTCGk27X1T8K
	LWA9qWPGcfzoCeEDgWdT1TxqP5iC/CKdzZtAdYvbEADKvLH/J3c5Wa1s/cCYRA==
X-Gm-Gg: AZFdTZebxefp6nZJwsQql9CCGPY0nsOEh2GTuFPCHG5pTkCxdeE0eYZEVmxFKhT5GEl
	ROSa5N5Xtte9opa0ul7QgYMeDilYI3cyU+sdX4NAEusZWaXhcjC67pRVvoZJofj3kDsx8c/iaTy
	OFftaxK72wRexGImkaKeiuK8qv8IOG0KXiGKoqbLUFxma45o5QvXPyom+EY/OzcGtJGrRrySpYu
	92KCImYfnxIGV1XIrBcND4tbQeNoNXuSJbXnjOXH5r/UgDQlBATxFCyWjJ4HKUXlKWmSWe9C6iY
	Mj7wgmhZU2YOzOFCpfsltK5nD+bQZVzOG4E1UU5Cn3Bvuy5SPQIx9WYdp0CZTz9eWoUIJvf7UqB
	ACtNIYhU+iKfLPSQlQiWa7SLFipOWZpJpKTXN0UVG6a6148mkBGiz+PGrKV1ofS/t09DoFUymya
	4in9K5ysP73roUyVrrX4sCB7dtu3EZbSe5kEgQlX+/Jp2tur56cxIqWrj+oxewgv00C14iT4jh3
	XmDTY8wFi6VLnkwoH332ZYxJX2+oqVLBOtJW9bhLCpcf5JqwMpD2u+D1ESS910PXL4xEE9XoQ+5
	4Zmso4rJ3Of7bKAiawefntToE6/hYK0RvwstfLXGT/XzNRc=
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr11588347c88.26.1795448378009;
        Mon, 23 Nov 2026 07:39:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:37 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] media: i2c: hi556: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:13 +0700
Message-Id: <20261123153927.2547169-3-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi556_set_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. hi556_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its clock and regulators
enabled and its reset line released.

The probe error path already calls hi556_suspend() when the sensor was
powered on. After disabling runtime PM in remove(), do the same if the
device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/hi556.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index a151bab26821..0d1d52d79a79 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1424,6 +1424,10 @@ static void hi556_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(hi556->dev);
+	if (!pm_runtime_status_suspended(hi556->dev)) {
+		hi556_suspend(hi556->dev);
+		pm_runtime_set_suspended(hi556->dev);
+	}
 	mutex_destroy(&hi556->mutex);
 }
 
-- 
2.25.1

