Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612182;
	b=nhHdBGUNIFGL4nSBvjG9ZJWNJgGRPuKf3wr3rXxT/ua6bmFl+l6NtB9GWhoGAG1nk+rw
	 ubRyJ0XPEVttmd8xTQAIO3jBbTNZsw0H2w7i3uFZLy1n70kITyzOzbfH9nrDdslSmwBSr
	 e7ovHQMRMyrh3eGXa64nlsZ3ZyZ1Cyja3r6Mz09vtfB51gqFOWDeHpmh/E0kxVPiKP+Q/
	 wSq3WyuCOIlbWoBeFxYEZ5d9hEpKCwS2UbWMs17dZ0ENRkUIBcGp78dyBlSG9KwfRM02N
	 CyLWp2M++tJYeAo+DO1Af4haNUYoyouwbRlTEi2naG1XFt+4Tf5uWEAwXG72+QTKy/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2EHKdHn/evGY492frENpI73JPa/bXks6zV07Z8DP8Pw=;
	b=3lU5x86LgDWha2xu4PCbbv8jajhGpPbslZHPQZ5S6IhxlTNjgtqwRLlJ3zClPLxfHpJt
	 dJNHNLl2UmAo8i6gLsTHJNNIqtWCsGTYJaq9gooSlBT+aqi+ISKZ+srNmgl0igNALqJ1+
	 aY3mVt5kuOI9olk15pYuLv9HbdMCSXK45iDWE74nQJ8Ub4+px+L1l63eXFEl8zJ59rj1a
	 N307wsKVD9iXDu486Y3blClKwHwrbd1Cs/L5tAJMKsachdw8y3VTgF3iD5buh7AsEnu9p
	 cSBon1J3X8Yb18jdm9Ce51yRNWEtEF+WVuuCb978TD/qMIDT4ros4yJoYfXG3k3jK/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vYA1hCDh;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150BC606A696
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150BC606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vYA1hCDh
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so3737516f8f.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612180; x=1796216980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EHKdHn/evGY492frENpI73JPa/bXks6zV07Z8DP8Pw=;
        b=vYA1hCDhxbqq8jX8v6q4FvQcD93zZWBJJHXYAYeBP5c2mK3U3/hl2LnFmPwyROHNtx
         6DpZbwAlederrAA1sq4fYGgBaDqHKfjoouMfKijW9rJgbMtkGyxNsgB4smlJaPrr7XL2
         pR0fBbTDILsqlBU+c9HSs/N6fP1nWaer+d3k9yXQYBT09TjuF7xQt0SZ+YQHx653vZm+
         /2CyEzRkJMCv/X8m1CewFLHq7IlClY5KIYexjseoa0seYGoqzpmku0CTSZr8uofgXoML
         X24RIES7iNZ389hc18/EzFwaFHZzI61Zt9nQIov3trM7+JCJSPUrCJ4Z/ybmLLTeNaSR
         RRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612180; x=1796216980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EHKdHn/evGY492frENpI73JPa/bXks6zV07Z8DP8Pw=;
        b=UxcD40W6t+Y2LfKYDvhYoy9/kel4P7x3w3jfmFV113rzC4oFfxsDCv5fLH95CzFk2v
         8YlTgj/9ui76DX5dHIL4W7w3qjoCz/CYkbSRz8saX8ThQZoUY9eMAT8TsYlN124mLw4e
         Bv6F1uUqzDSL05kWiAbBUjdDKy0fvgqOXhfaUETosRFOls7vXKoXjjzvaz02Kv3gUUsd
         0VjlR+jkjHC032Eg1uC1muvdvIiWYJjbXj18HJW080SyFN27AxufoGxVoizCEG4QnUMe
         O22a39Ge8Vjamx957vZfc2w++Mps+uqmo+Wcknh9N/nHprp+N6e30H/WqLOQcxoyCyoQ
         rLzA==
X-Gm-Message-State: APuU4Z82UmHQfoWS68Ik3YjZPIeQxjOzcDVAQh1jumKu8cj6PRGvhZLJ
	v+GcC+5tIIN5/mNnLuQDnhokxIKPZVDWIrULSGFjZXAGNTPnSxHRkHyy9E9KztYjX0U=
X-Gm-Gg: AZFdTZd9J4iVkZFG/rTrOmbv46WSrfAhjAy1h/fCd+Z7MF/R/vSR5G+dROm6vyCo73A
	Ur6KAyhUJNeJFQV3REWlMDqYDsbiwbeN6XQbRUnYARSl9EwsTGJJLXz7BznrYYuX4mai9X26Wrs
	rmtAgnjKku/A9C2pHAkzZKyKkMJjtT4+RKVSRUgnOTi2d5xgidzLGnO0oYV34L99wKv3gQUbyzz
	3sF0nhF7NFY4PTT9D3tzZrC7sVG2oOSzVxM9fnrOoC/MkUNycKVKhs0BrMfXoN55/hfOE4QG6sN
	KyPbmSpf589R4i2lOTzYx4q51D0GWQzFbVWUYYwOxGV9Qe7wGXD55tl7c7gHQaYTRGQOqiHwRdY
	4oa50fMQTUUvUY9NRUlwHlTOm5VL/v/eZSJ70fhg1Uph7kc5VD5tcx71Yq/xjtNlUWHhjKCjxDM
	nSI/xHhIbnrEw/TP4C80PEqd7hLSGQv0QYxvC4h53+pFSF2NMPV/FpYSJbu1nazKR7iSZFEbvuQ
	aYijIPfXvteR1HGjNBAjZ8ddL+E5cXBbItBhI6KMKjxgflmamP+FcSNrXVZmV3Th+5c9cX7QzEK
	IF0HGDtp21i2/rU2aBt+nmbgDxBeaDH0NsAltZoNH7dtib55Lg==
X-Received: by 2002:a05:6000:2903:b0:4b7:70aa:4553 with SMTP id ffacd0b85a97d-4b770aa4574mr10550337f8f.38.1795612180312;
        Wed, 25 Nov 2026 05:09:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:32 +0100
Subject: [PATCH 05/11] media: iris: clear the stopped state when the
 decoder resumes
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-5-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=f3feV/1DMgSfL2CmzIHAP9+r71wRu+v9Ez6CcCCVkxs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4MfTtWqMX7j9xdtH+gM3bx8COMHUn9f775o8YT
 TYEMpjOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDAAKCRB33NvayMhJ0SZrD/
 4896I7D8wrXyxCNszgiSlEvqG7vrw5O+eNY4f+lErpVTdGJNplXM7tNsFXj5fzdfa9v/mpwpGLHTSQ
 6Q3zojETOdDH1osgRbayKKmlzjl+mQwxew7O/FSEeGOhBu0BBh8h5kOT3O9/Ui5d0lqG83IqiJdBxE
 40guhE2NyR5r1WJnBiawQqddxDogbkFw2hqoo0GMn3GB+OOoGQzcZS12GKl9NrtjANXcTHfJchJ4Y2
 cDDjj6QjdkCHgYbs75rrmCS1UN3cOweIQS93ro1Ep0bxuwiIaxOzP0i3dlRRSjsrMMJz4c3yT1i5as
 yz8RA+Qm+GeW9atog85dadQkIHVy6Vwt29lB20S5ROxFEFDOJuDLb6zdLiHGVW2Pqn7U0UC8TFsjIC
 9C6BxNz+5Tbc7wKAypjnBwNqDvz1XFKz2TwFFdAu2u8T2XJOwL+6eoMJNqK0NgG3Z09Lmu8G15Mnxc
 CtkwMoTbDerlvAeDICg3LxMMYsoxxUs9rODxDjfaS83GKNsmqaa0zCi2AI4x5dg+pSqTb1wwog0C96
 aS8TC4zKVbK6YYEVPzNcyy4cWJeSuSif8DSJVPIQjEUOsazUmq7frVCD+4QEargK1fn6Aqk3VrKaYz
 l+RNoIIPtVBZ9dFlVJ435IIdY/Ho79qNx/bcFTJ6oHleSQ0EwKjwBGp9vaHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

V4L2_DEC_CMD_START resumes the decoder after a drain or a source change
but leaves inst->last_buffer_dequeued and the m2m stopped state set, and
STREAMON(CAPTURE) leaves the m2m stopped state set:

- the LAST buffer of the next drain or source change is not flagged on
  gen1, and iris_vb2_buf_queue() does not return one either;
- iris_vb2_signal_eos() does not signal V4L2_EVENT_EOS at the end of the
  next drain.

Clear both on START, and the m2m stopped state on STREAMON(CAPTURE),
which already clears inst->last_buffer_dequeued.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_common.c | 1 +
 drivers/media/platform/qcom/iris/iris_vdec.c   | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 25836561bcf3..61634df56797 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -151,6 +151,7 @@ int iris_process_streamon_output(struct iris_inst *inst)
 		return ret;
 
 	inst->last_buffer_dequeued = false;
+	v4l2_m2m_clear_state(inst->m2m_ctx);
 
 	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d35a1eb62d30..6369370a04a2 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -584,7 +584,14 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
 		return -EBUSY;
 	}
 
-	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
+	ret = iris_inst_change_sub_state(inst, clear_sub_state, 0);
+	if (ret)
+		return ret;
+
+	inst->last_buffer_dequeued = false;
+	v4l2_m2m_clear_state(inst->m2m_ctx);
+
+	return 0;
 }
 
 int iris_vdec_stop_cmd(struct iris_inst *inst)

-- 
2.34.1

